export default {
    to_YYYY_MM_DD(date: Date){
        return date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate()
    }
}