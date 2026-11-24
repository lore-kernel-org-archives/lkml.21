Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522577;
	b=JAhYtP58LUnBDu0q9pvmDE6Wwl4WEf3Vl+/0eR4jvCW8gzGI4aylMhxeFkvUgtzSOSNG
	 vTqbpabekWPU8iffBMjyL/4DY5H2s8459liyhmox6ikKZPbbJQ3ceaGg83wbmhEZSzQY2
	 v5ZIXpOhE12Bd0WK4WB+MgJdcnjV2rJLMU3mJGmbZMT50XyLlutzafmoO5q7AAlVPBabn
	 IswjS5TH7YxrRjH35GH0sm9GhLlLJvPi05XkIoRMPwvMGxkIr9n4rnyW1IIFwaw7jlDGF
	 V0I/SDmOF/ZgqCgzWqiLVp8Bm4aGGYQPnNFoRHIYXQ7QFNuAyatDw8IHivAy6CVttGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FwhaqWUjSIW6EMpKOPqi42yvxqCff3SEZc5RRREEmFs=;
	b=msPi8AIwGVTAOmtYb/o8WHmoZ6imStXzx3KMjlBKOUwVvoxWntjfyLcrrdMA6HQBKkZ4
	 50pV3uUYgjcJsFKlzdKjY6SXGCzNpsffs9920s0k2YhfjSAueRhCKHtvEg3NubIoCQ0wx
	 oRAR+AnaFyBICCcIL7ApCIABQmAVseLyAq+GHXPt2LNticy2jYtnruhGDN4xCmPCz4WvO
	 UaclbfOf8BIX4FzNtcepAMOhcwuAaLAwuiQvcuuCA6uCHDTsu6BmHDqqgzwktm9MmG/fs
	 BMITNaZmPbWg1/kZ0YKJuXaHtkLsWuIp7WpSrOB7V40Y10fmT+wLVre3XbGJdjoSvgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=foML1HiD;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EC5606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0EC5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=foML1HiD
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38190551625so9002016eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1795522576; x=1796127376; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FwhaqWUjSIW6EMpKOPqi42yvxqCff3SEZc5RRREEmFs=;
        b=foML1HiDg0i2JwV0Ln08y9Bb3PaYElgruBIa33RMSp2PjsLDdEjI3w+MFe/q/lZ1so
         9nK7n6cMPfPfPKm/SzmCaZMeyigXUtUQnXLnyDInpioR8MGPkXs8nVUxCa6gSC4CTKj2
         5N3yUtsyrYsV3BvlMRaV+RUOAINtyf40zsJ+aVdrS/gElxAN1m6nazcACJrs0iW2OGsJ
         q6OzD33oMbkqFRS/ZKdsLvPBkhY/U9GMYwAqAKG1Hx+75MJoUyxmrs4pvCWPLrJWYCJ2
         CINNCAwm6o1cjZ/nL1LPsj4X1t1TYCUzB8H5mjb4/nME+9yJ8+SJ/Ys3qlf9Dse6rgWO
         pG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522576; x=1796127376;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FwhaqWUjSIW6EMpKOPqi42yvxqCff3SEZc5RRREEmFs=;
        b=r1iisWgwErmLS2LfDXn8GD4poVz+E41VydI8w3HV+/IeXb+FG6dlmzf2TXi9IGKhnJ
         jZSj6SlgLou9sqzormv/vOP/kyc2TwUovdRD4GYMBfS/XuuDsHHgM5Z2lLhS8vG5szoe
         AP6KvftUj6wV+LqxIQkO3vVBxKDQS/S2WQ0lTPJCiRBin+10cnj9ij/JQbNM+IqrEui6
         jgQR6QgdOAYm4H62eqUbcWWyor1dNbDZp+KdKYBj/WnecydVOBxE32nPZeIofPJFw7an
         kbGGIbK3uxpsY1VgE6Ew/PgxuMWfee963c7sdwplx/2fpuV1WZ+UbuLXJ5TK6jAQGOus
         zsaQ==
X-Forwarded-Encrypted: i=1; AL+hErEJhunCdye2LqgfQ9wMFNk49xN1WG1fPhAziAnqjrFNZrwJglFerp2geph81EVxAovZJe3voG8S2R/cwzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8+d0k0tbDSmMJ+S9/Inow9zn09lnTbYjzHCxsYp9iWIIII4NK
	ieojiDRbv0diublMEik02q/h4U17I4bJRRLOFnQtShAyWTtenKpSpWBCd/CA+hheKw==
X-Gm-Gg: AZFdTZcBdO588GQdQ1Ns/dIZ4W0CGW7PMG21R+eJoBELWp7VfkKp0kU2SZ2cZ6Nhxxv
	iIBBl8MAZXjWboAA/nrimiETpxxKJk6ETtVcgLiF6+Su5XpNCBca73ULyznipMKdhz2qd+ity4M
	fJTbfZqN7bdzz2/S/1hg0mbvyoSCQPOxCsvr8J06O/5qRq7oRjhwNaKMGi9w8FLECsqCefdPyVz
	zJfVXE7JjrirHWBGGNZniccWF/E1FmBf4ithMSFr0Gen6/sjJuFpzvLqTx5YoThd6Cwq3JGE2hk
	CfTmmXTOTbBkv0q5Cr3vh2QQGJqpLLcIaBucpxGQl1kyTnx9tPmVSbTKZMU9kdDiU7pvV1VXWmG
	yzQdil1LpcU5czqhb05TqFAYfZ66i/hDC7/Y1kplpqFyrhFZxkppmwhntBjQSHGYETs+ZRvRQ5o
	VFCyP/mNSNUJuO24r0rSYYCs8w0Ak9hl4Kv6GN8JUBJcy4GlinO0wW85bQfLZwPyh6zVYcpa9qZ
	DROyTRIjKVxD3g51fiQscqKJGCLKVXUXW4C3R0pi8mt6YIXIaWMxKP7jb7GHbVbMj7O8YMTvwhI
	OCDi+ucrTqbeuQOmv6Jm2Enr5Hg2lGYoeQJc23Y=
X-Received: by 2002:a05:693c:42da:b0:386:95e7:8497 with SMTP id 5a478bee46e88-38695e790e1mr11295825eec.28.1795522575327;
        Tue, 24 Nov 2026 04:16:15 -0800 (PST)
Received: from [192.168.29.131] ([2405:201:4019:32fc:2fd:478e:999:d6fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm42026281eec.16.2026.11.24.04.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:14 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 24 Nov 2026 17:45:14 +0530
Subject: [PATCH] ACPI: power: Add serialize_power_on_quirk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-ssd-fix-v1-1-ee8ef43190b1@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqAIBAF0KsMf62QBoZeJVpUTjWbCgdCCO8e9
 A7wXigXYUWiF4UfUblOJHKGsB7zubOVjETwnQ/OeW9Vs92k2rAM8xL6OMSQYQh34U3qP41Tax/
 DpNu1WQAAAA==
X-Change-ID: 20261122-ssd-fix-6b7ab639796d
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5655; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=S0z6z4N3ZMIBglxNCwabxNIKv0VTwOKGh+I/Nze3qpw=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBrBYALgPhdbLsnw4jjC4NJbI51eSG0JOXyuP+Pc
 Ev+6RXeqXGJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCawWACwAKCRAFzvXHieVa
 dO+oD/9m9b0n34IlNsaMtwkxUECuBH7WpIoHV5NraHW9R+A9prza461kxMRJdPUzTIY18xZD7XH
 hcLz7XdFFkvsQ7fVM07oMoQRf1nmXY+gXgzK3x7UlXb1+gsc8Y9mUunOdL+oWVHP7UfCbNHPNII
 DkIPoFHlpxNwIYfK9OKhTZB3EDVgi7Ef+JAR4FIuPWk4RKviqLPKROiUagqJLuy2EsLo6I/Zfse
 hKJ8Zbdq2itjlt6RuzVXe695Orlsc90CsrslF+gwZshkLjFSSr5aaDKJVork6qUEIXYksv+ZZ7K
 FKShv2LOiPCN+zEsAVCh+dT6QCuGW9iV+lBVx6SJU4+MO4PvsB9aAC4NM+YzRjaUnQaBcp6u7U3
 TjxKoKptJ3p3PAD7a3Lu5noFiSvOvC1ON9gcbquw4sMkU87nqfJUUm0yS8PBJj6Ix6AINHnggQL
 ZphQIX1EJFL+lZmlqy3ueW8wuAjTa8uw2m1akNTBB3YW+V1M5kQc9TdMORD2Ne+ZlAjaI6KdZeQ
 4rZWr+SIdZaNVfQ0956zn7N8MlMitk+SM9LPefWskkRBsLvl7ZFOyi4lWJlI0usypKjk3i9Iwh3
 O68hea5Hrz2rxExpUeIEO7s+nOCdhtrEmMXXKVSJ566nwy0CIE19erXZWuev5n4ZRMxtUK3mNZD
 eheDsQJb3MtrWgw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

On the Lenovo Yoga Pro 7 14AKP10 (83KG, AMD Krackan), the NVMe drive in
the second M.2 slot is frequently lost after resuming from s2idle:

  pcieport 0000:00:02.1: broken device, retraining non-functional downstream link at 2.5GT/s
  pcieport 0000:00:02.1: retraining failed
  pcieport 0000:00:02.1: Data Link Layer Link Active not set in 100 msec
  nvme nvme1: Disabling device after reset failure: -19

The _ON methods of the two M.2 slots' power resources update a clock
control register shared by both slots without any locking, and sleep in
the middle of the update. Since the root ports are resumed
asynchronously, the two methods can run concurrently, and one of them
can undo the other's change, leaving that slot's reference clock
disabled. Its link then never trains.

Evaluate power resource _ON methods one at a time on this machine.
With this, 20/20 s2idle cycles succeeded, versus failure within 1-2
cycles before. Also tested in normal laptop usage for a few days.

The same symptom has been reported on the closely related IdeaPad Pro 5
14AKP10 (83JL) [0], which may need this quirk as well, but it is not
included here as it could not be tested.

[0]: https://ratatoskr.run/linux-pci/2026/04/6586201/t

Assisted-by: claude-opus-5-5
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
On the Lenovo Yoga Pro 7 14AKP10 (83KG, AMD Krackan, BIOS QFCN29WW),
the NVMe drive behind root port 00:02.1 (ACPI GPP3) is lost on nearly
every s2idle resume, while the drive in the other M.2 slot (GP10) always
comes back. Updating to the latest BIOS did not help, and neither did
disabling SSD power management via kernel parameters or recovering the
device from userspace.

The "broken device, retraining non-functional downstream link at
2.5GT/s" / "retraining failed" messages come from the Target Speed quirk
reacting to a link that cannot train at all. The actual cause is a race
between the two slots' power resource _ON methods in firmware, which
can leave one slot's reference clock disabled, as described in the
patch. I can share the relevant AML and debug logs if useful.

Testing: 20/20 s2idle cycles with real S0i3 residency, versus failure
within 1-2 cycles without the patch. I have also done normal daily use
testing outside of synthetic suspend.

The IdeaPad Pro 5 14AKP10 (83JL) appears to have the same problem on
the same root port [0]. I don't have one to test, so it is not in the
DMI table.

I went with a DMI quirk that serializes power resource _ON methods
on this machine only. If serializing them unconditionally, or some
other approach, is preferred, I'm happy to rework it.

[0]: https://ratatoskr.run/linux-pci/2026/04/6586201/t
---
 drivers/acpi/power.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c
index 23a4e207a01e..b997d98f38c4 100644
--- a/drivers/acpi/power.c
+++ b/drivers/acpi/power.c
@@ -64,6 +64,10 @@ struct acpi_power_resource_entry {
 
 static bool hp_eb_gp12pxp_quirk;
 static bool unused_power_resources_quirk;
+static bool serialize_power_on_quirk;
+
+/* Serializes _ON evaluation when serialize_power_on_quirk is set */
+static DEFINE_MUTEX(power_on_lock);
 
 static LIST_HEAD(acpi_power_resource_list);
 static DEFINE_MUTEX(power_resource_list_lock);
@@ -362,13 +366,27 @@ void acpi_device_power_remove_dependent(struct acpi_device *adev,
 		acpi_power_resource_remove_dependent(entry->resource, dev);
 }
 
+static acpi_status acpi_power_evaluate_on(acpi_handle handle)
+{
+	acpi_status status;
+
+	if (!serialize_power_on_quirk)
+		return acpi_evaluate_object(handle, "_ON", NULL, NULL);
+
+	mutex_lock(&power_on_lock);
+	status = acpi_evaluate_object(handle, "_ON", NULL, NULL);
+	mutex_unlock(&power_on_lock);
+
+	return status;
+}
+
 static int __acpi_power_on(struct acpi_power_resource *resource)
 {
 	acpi_handle handle = resource->device.handle;
 	struct acpi_power_dependent_device *dep;
 	acpi_status status = AE_OK;
 
-	status = acpi_evaluate_object(handle, "_ON", NULL, NULL);
+	status = acpi_power_evaluate_on(handle);
 	if (ACPI_FAILURE(status)) {
 		resource->state = ACPI_POWER_RESOURCE_STATE_UNKNOWN;
 		return -ENODEV;
@@ -1096,6 +1114,24 @@ static const struct dmi_system_id dmi_hp_elitebook_gp12pxp_quirk[] = {
 	{}
 };
 
+static const struct dmi_system_id dmi_serialize_power_on[] = {
+	/*
+	 * On the Lenovo Yoga Pro 7 14AKP10, the _ON methods of the M.2 slot
+	 * power resources update a shared clock control register without
+	 * locking and sleep in the middle of the update. When the root ports
+	 * are resumed concurrently, one slot's reference clock can end up
+	 * disabled and its NVMe drive is lost after resume.
+	 */
+	{
+		/* Lenovo Yoga Pro 7 14AKP10 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83KG"),
+		},
+	},
+	{}
+};
+
 static const struct dmi_system_id dmi_leave_unused_power_resources_on[] = {
 	{
 		/*
@@ -1156,4 +1192,7 @@ void __init acpi_power_resources_init(void)
 	hp_eb_gp12pxp_quirk = dmi_check_system(dmi_hp_elitebook_gp12pxp_quirk);
 	unused_power_resources_quirk =
 		dmi_check_system(dmi_leave_unused_power_resources_on);
+	serialize_power_on_quirk = dmi_check_system(dmi_serialize_power_on);
+	if (serialize_power_on_quirk)
+		pr_info("Serializing power resource _ON methods\n");
 }

---
base-commit: 988117cc1bb17338c586a4e21ade88b5397eac33
change-id: 20261122-ssd-fix-6b7ab639796d

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

