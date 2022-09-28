listView('/Tenants/BLD') {
    description('Deployment Jobs for BLD environment')
    jobs {
        regex(/.*bld-.*/)
    }
    columns {
        status()
        weather()
        name()
        lastSuccess()
        lastFailure()
        lastDuration()
        buildButton()
    }
}
