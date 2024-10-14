import React from 'react';
import axios from 'axios';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import Typography from '@mui/material/Typography';
import Box from '@mui/material/Box';
import { DataGrid } from '@mui/x-data-grid';

import Container from '@mui/material/Container';
import { createTheme, ThemeProvider } from '@mui/material/styles';


import AlertDialog from './AlertDialog'

const api_url = "http://localhost:3001/api/collaborators/"

const dataColumns = [
  { field: 'NOMBRE', headerName: 'Nombre', width: 150, align: 'center', headerAlign: 'center' },
  { field: 'APELLIDO', headerName: 'Apellido', width: 150, align: 'center', headerAlign: 'center' },
  { field: 'DIRECCION', headerName: 'Dirección', width: 250, align: 'center', headerAlign: 'center' },
  { field: 'EDAD', headerName: 'Edad', width: 75, align: 'center', headerAlign: 'center' },
  { field: 'PROFESION', headerName: 'Profesión', width: 150, align: 'center', headerAlign: 'center' },
  { field: 'ESTADOCIVIL', headerName: 'Estado Civil', width: 120, align: 'center', headerAlign: 'center' },
  {
    field: 'Riesgo', width: 200, align: 'center', headerAlign: 'center',
    renderCell: (cellValues) => {
      return <AlertDialog age={cellValues.row.EDAD} />;
    }
  },
];

const theme = createTheme();

export default function Home() {

  const [collaboratorData, setCollaboratorData] = React.useState([])

  const getCollaborators = async () => {
    try {
      await axios.get(api_url,
        {
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json',
          }
        }).then(response => {
          console.log(response.data.results)
          setCollaboratorData(response.data.results)
        });
    } catch (error) {
      console.error('Error', error)
    }
  }

  return (
    <div>
      <Box sx={{ minHeight: 100 }} />
      <ThemeProvider theme={theme}>
        <Container component="main" id="home">
          <CssBaseline />

          <div className="form2" id="divHome">


            {collaboratorData.length === 0 &&
              <Button size="large"  variant="contained" sx={{ backgroundColor: "#F4F6FF" , borderColor:"#EB8317", color:"#EB8317"}} onClick={getCollaborators}>
                Obtener datos
              </Button>
            }

            {collaboratorData.length !== 0 &&
              <Container component="main" id="container-info" sx={{ minWidth: 250, maxWidth: 1500 }} >
                <Typography variant="h6" id="tableTitle" component="div">
                  Colaboradores
                </Typography>
                <DataGrid
                  rows={collaboratorData}
                  columns={dataColumns}
                  pageSizeOptions={[10]}
                  pageSize={[10]}
                  initialState={{
                    pagination: {
                      paginationModel: {
                        pageSize: 10,
                      },
                    },
                    sorting: {
                      sortModel: [{ field: 'NOMBRE', sort: 'asc' }],
                    },
                  }}
                  disableRowSelectionOnClick
                  getRowId={(row) => row.NOMBRE}
                />
              </Container>
              
            }

          </div>
        </Container>
      </ThemeProvider>
    </div>
  );
}