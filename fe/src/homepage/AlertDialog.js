import * as React from 'react';
import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';


const get_risk_level = (age) => {
    switch (true) {
        case (age < 18): return "MENOR DE EDAD, POR FAVOR QUEDARSE EN CASA Y ACUDIR CON UN ADULTO";
        case (18 <= age && age <= 25): return "FUERA DE PELIGRO";
        case (26 <= age && age <= 50): return "TENGA CUIDADO, TOME TODAS LAS MEDIDAS DE PREVENSION";
        case (age >= 51): return "POR FAVOR QUEDARSE EN CASA";
        default: return "FALLO AL DETECTAR EL NIVEL DE RIESGO"
    }
}

export default function AlertDialog(props) {
    const [open, setOpen] = React.useState(false);

    const handleClickOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

    return (
        <React.Fragment>
            <Button variant="outlined" onClick={handleClickOpen}>
                Nivel Riesgo
            </Button>
            <Dialog
                open={open}
                onClose={handleClose}
                aria-labelledby="alert-dialog-title"
                aria-describedby="alert-dialog-description"
            >
                <DialogTitle id="alert-dialog-title">
                    {"NIVEL DE RIESGO:"}
                </DialogTitle>
                <DialogContent>
                    <DialogContentText id="alert-dialog-description">
                        {get_risk_level(props.age)}
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleClose} autoFocus>
                        Cerrar
                    </Button>
                </DialogActions>
            </Dialog>
        </React.Fragment>
    );
}