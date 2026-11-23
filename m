Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.52.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431528;
	b=zLL5Tug9boM0dPmj/mBRDWJkodSAscFmAPzQHnNwxEJFKilQDGghCcY08dEk1lAl+TRN
	 mshqgy1XTGv2BaYylxSBekvTwtrYg9QiIZ1STrKK/YcMAGK3SPpZGYLCQmoEfOzhe2njl
	 sH5O6Lhkjxuei2oDpwr/3HngL2f2FtjRdtyCRPIWlvEBRyotLRCxIUtxWIopCJ0uX5pp7
	 X288j5qd8eR+PF1KJGRa57RJTttVxzXoaNg7DGo3P6pMrl59uIeT8iDaqRP3ALnaA2mPQ
	 ezg4L12z0x5JA2JZDkVBb9RXxHVj4uYTyOmRIgAZeKvivQVoVuloolufl/RCzFs04FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431528;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
	b=dHilqbN/a8rT7aOvsCKplqDuHxJHoiCpz+NnZdIyzhHQAs6/7w1I5lwlw7kdp1Bsd47U
	 qHSPP677ZfSM2/08/qGA36DhjfERr1/aLBwBTievjF7QALWfP8b9l1jG/gPj1rVM0hsfJ
	 tGbdUpkC/YLHhqVvY5aPebTJwetaUy4GC3GWx7Q2LWcrK5FvBrxvQIMOhO8TWAxEFOnFP
	 J65E3+0oKvInsRwPXJa+N8fLC8HNLfAt8q58vkHmirzJe9f3+t/LEHnFJewbSW5ZE35/J
	 fL8mqCMhDe09ln5Nvp8Q3fRllnaio2z2MLiNOay7MxH9X1RNgf80eTudkWbNwcyJKmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b="O/H1LJ0j";
	arc=none smtp.remote-ip=46.105.52.148
Received: from 10.mo583.mail-out.ovh.net (10.mo583.mail-out.ovh.net [46.105.52.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBAD606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFBAD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=O/H1LJ0j
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.254.91])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4jY2xD0QJhz5x0M
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:58:40 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-n2gw4 (unknown [10.110.168.167])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 88CE7C0144;
	Mon, 23 Nov 2026 10:58:39 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
	by ghost-submission-7ccd8bbbb6-n2gw4 with ESMTPSA
	id ObWlFF4cBGvNugsAptLdCg:T2
	(envelope-from <filip.golas@3mdeb.com>); Mon, 23 Nov 2026 10:58:39 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G002f90511b7-fe43-4655-9d7e-26a1e09181b2,
                    0A512C1CF0928FB71961449F2A077E304137B0E5) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v2 1/3] platform/x86: dasharo-acpi: Extract dasharo_call() from dasharo_read_channel()
Date: Mon, 23 Nov 2026 11:58:19 +0100
Message-ID: <20261123105821.305527-2-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123105821.305527-1-filip.golas@3mdeb.com>
References: <20261123105821.305527-1-filip.golas@3mdeb.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 2044634231904923631
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFDblFX0lx0QRW1JKa5GExgvRc8EfAmGpZCa+mczr64uGFbhOUDNDRjGumNpw1ewf38CiuDwcWBe2ksOTz2vgBG/OiQfIRySeImPlGnBaN/NhaVBJcI0R0wiJZ05v/JgVIK6iF8FdDs4paOTnHT0UKtcfyQnnoEHkbJplb8AAmbCQ9anws2PovtC1vetouu4esjSK9/7AKz4dEqFuZzYfu9hDntJhu7xuegqj+tPpuZ1RhtmyCUSIcP8LBva1zYL6sFArph+EvMDv9DjODHblGBXMhTfQmi0aTZNEufLRK0995CYUMgwFWztvqoKHu9U1DZt+zFLszdo6g6L37VIcSPnSAPTMrnT+EjnOY+fMBRMaVMJhscDLCK6dKL9vCUWTrrsB5fM8QcQMARxltzFqrwV26qbzBgezKQEFXqxmBH2v0pfJDyhOm+l9qdTwczupvLFGbDO+LwNJEkkNWlKtMc77WmM9gG3ncojwEFAXZp/nswzsMtQrxEsoL8z3FW6jmosmsJmK5+agErgOqUxFnrq7ARDmYTDhHsdqwWIfwzNkm2tjLJmGQfBHZ1LckTgPbOiTH2SDHc3V2u/cWyZTZxMD1IutwuHQWJtEi29r0bcNTRpueGJcdCVwwn34JqQalpINZ0MR4s92La2S6xem5wUlMZayV47omFSezQUITWjw
DKIM-Signature: a=rsa-sha256; bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795431520; v=1;
 b=O/H1LJ0jQ6smI/gQrsm4BZBFXJ3XJN0uCG7KhphGFBW008mGXIYoOHmKFXcQH9/H0Z8VDqm8
 thG++IX3PbCLWyYAnF1sOFMKBGUJ6VIrBa105uw5kxnBfntSHaKCcJswIXYU04kI5nGQzTFtzez
 MSi467cc4I0IJrb8EV5MVSVE/HPCD5fsktRv+i/7k5xTIjmJEwREKHsiCYsOuUbe9HdqaQgpUVe
 sNuUWokfHVwaSq+H0LEe2J/EISh8N3krSi8QQZskM61EEIDTTZ1zXJbSGFExn7R7nyEMMhLbDk5
 3+APdR7gkt+SZgalAEeLG5/qEqUHo8Og+pvhWWe+JB4lg==

Move the ACPI method evaluation out of dasharo_read_channel() into a new
dasharo_call() helper, which additionally accepts up to two extra integer
arguments after the channel's group and index. This allows the upcoming
write and fan curve support to reuse the same code path.

No functional change intended.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
 drivers/platform/x86/dasharo-acpi.c | 40 +++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index dfea00cdde18..13d97eb43511 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -93,13 +93,18 @@ static int dasharo_get_feature_cap_count(struct dasharo_data *data, enum dasharo
 	return count;
 }
 
-static int dasharo_read_channel(struct dasharo_data *data, char *method, enum dasharo_feature feat, int channel, long *value)
+/*
+ * Evaluate a DASH method taking the group and index of a channel, followed by
+ * up to two more integer arguments, and returning an integer.
+ */
+static int dasharo_call(struct dasharo_data *data, const char *method, enum dasharo_feature feat,
+			int channel, const u64 *args, unsigned int n_args, u64 *ret)
 {
 	struct acpi_object_list obj_list;
-	union acpi_object obj[2];
+	union acpi_object obj[4];
 	acpi_handle handle;
 	acpi_status status;
-	u64 val;
+	unsigned int i;
 
 	if (feat >= ARRAY_SIZE(data->capabilities))
 		return -EINVAL;
@@ -107,20 +112,35 @@ static int dasharo_read_channel(struct dasharo_data *data, char *method, enum da
 	if (channel >= data->caps_found[feat])
 		return -EINVAL;
 
+	if (n_args > ARRAY_SIZE(obj) - 2) // 2 fixed args always at obj[0] and obj[1]
+		return -EINVAL;
+
 	obj[0].type = ACPI_TYPE_INTEGER;
 	obj[0].integer.value = data->capabilities[feat][channel].group;
 	obj[1].type = ACPI_TYPE_INTEGER;
 	obj[1].integer.value = data->capabilities[feat][channel].index;
-	obj_list.count = 2;
-	obj_list.pointer = &obj[0];
+	for (i = 0; i < n_args; ++i) {
+		obj[2 + i].type = ACPI_TYPE_INTEGER;
+		obj[2 + i].integer.value = args[i];
+	}
+	obj_list.count = 2 + n_args;
+	obj_list.pointer = obj;
 
 	handle = ACPI_HANDLE(&data->pdev->dev);
-	status = acpi_evaluate_integer(handle, method, &obj_list, &val);
-	if (ACPI_FAILURE(status))
-		return -ENODEV;
+	status = acpi_evaluate_integer(handle, (acpi_string)method, &obj_list, ret);
+	return ACPI_FAILURE(status) ? -ENODEV : 0;
+}
 
-	*value = val;
-	return 0;
+static int dasharo_read_channel(struct dasharo_data *data, const char *method,
+				enum dasharo_feature feat, int channel, long *value)
+{
+	u64 val;
+	int ret;
+
+	ret = dasharo_call(data, method, feat, channel, NULL, 0, &val);
+	if (!ret)
+		*value = val;
+	return ret;
 }
 
 static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
-- 
2.56.0

