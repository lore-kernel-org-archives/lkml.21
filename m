Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164260;
	b=AINEp6NnYpRXAewX8uWxktG9FzDS+tTdkggs4Mr9RYh/wrW66xVOuZLZj2Nnln2CkMap
	 fDJdgiooOw0fy2nzsDLEFTv3mn97jZP9kcJc/h2I3r9jVuxpHKXc9+///Svk7mpVr5/po
	 ONiZf4fzT3kCTufyfMzRAvLtVnBNmBT7+MwM7jx+OeI1uaAXoekTVgFS6+BfSDaHRRNR4
	 CUfGp5Cn+GavdJCx7qbq9soTEKnLFH06k+Lx3IW/ezVBkp0bjWKoROumvVNfXrWwHAMnz
	 qzDUGs962sLUhdKU0hSJJmnWshIDDJ1ukoJ+eHcm2QJOWZI4Y9q07Y46q+d+0FhGn8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7DeemdZLIhx/5jLSpJJ+WPwy9ZHOFCasR0T6JfI13Q4=;
	b=dAU9DiWZXVAMItgn1Ndl9QAjUmJp7r209qmtmHqjQYf6f9ccNHAgkO4F4kh3kLfRPmM0
	 KiLt7qih8DizSIf1Xc52Pipo4ZBmvMZPeb/wPOo1/Yl6z6d/YzNpkDoCB0sg+KKhqeU2H
	 v5dP0no018twCt+Zj8K4BQIObX45lH8LK4ZpT7ClyoCcfkagLH6Z39dfVKczS1wtKdAmV
	 8rEIXT4ZmrRDPrZV26v8NrNa8YuE3PJe4X8z7Sdp0xgJjtSErLv2A02NNHdql/MU/WIoB
	 t5kt568LleTYfZFSGu8Z0czbj6vHt3VnAoH6KmfnwSaP94v6g/owmzZWFshVrCJh9pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AxvA3R63;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290C60A3808
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8290C60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AxvA3R63
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b244fb7fffso646694c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164260; x=1795769060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DeemdZLIhx/5jLSpJJ+WPwy9ZHOFCasR0T6JfI13Q4=;
        b=AxvA3R63wMA0+a/F2E89T9p/cl7WNbLcVtKmXMnIhtsgAK55GQrNxeZ3sVVR6dEeav
         omaOfWqDIFN7OzXRRklrcpMJ7p25SaaRbr8VW4u7+xFRgAr9rCJQDBNoOiCYZ0zUjS+8
         S/tUcYB4h8xcih0Qmo31haV7p25i7MKy4emI7xgYcpNbbHsPykx7PUpyRbQI6YC1JEA/
         W4W8cGPOUJbZ4twG8GNV6yjc7T+0F1KGYkwZ82RRBhFMyXk0TmKmNS4/OCx6Q+uiO12/
         dPSyxxHQitQEuDcQ8rpL1nHViRkwqU/VjZFa01KlxjGX9LYVrctI2m0pL+du2QL0NZ7z
         pq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164260; x=1795769060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DeemdZLIhx/5jLSpJJ+WPwy9ZHOFCasR0T6JfI13Q4=;
        b=g7PwfSzvchtAm01xe9asIK+g+6S0iRJJFzrC+FbLOfQKJEPDwCmJxUYrCY/SRtf9Gs
         Tybyt5PBjFGpSkiR3Jo6F5mt+sQzwSJlt/3iQS2T+vv2Alu6cgNWnru6OxyjaYWFbFN0
         0jIknb+qScYnu/sHIDq+IBmF5IPqW6PJqNeJXd6RfCVlMYZyZkuH5qTAFkJvsPDUGXwX
         tzOmFjuvVneQ3OM8L+fk53apiS2OaMWKfybc7lIscZLbcDGjKa9nRNVuoOd8xB9udClj
         1erVjF5OUJsbdM0nayfoiecvQ5VpTm4FCaZ44vP68VvzgHJ092YZ5x5dwYvDSrvGckP6
         YLFQ==
X-Forwarded-Encrypted: i=1; AL+hErF/8FOsi+8WabPnkKAdAETZNt8sIeEkWUo6NBdcErQm2TqbTkSRGDr4XkgJy0fNe5rGmgNdXKSzAXQe78Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q9luO4+6TIYoaFQpY026YUQGJJ9Jt4KoxcKVybyUee9aQ9Y7h
	cJ714nwui1JMqrM7uBVOXYCeH7FQnxXXEWkQP2tDEWg7O/VzS4NOCsL6
X-Gm-Gg: AYBFou2/lp1wW+mq/5dvB6X0TOR9nzn+W00TxrtiGI2ISoqSRRWbqgS2Vgp6mS545fP
	nLQqxNOE/+tKguCCuF9wltE1B8QZDJ/uBz8FpZ952m7b9oreMi75fZkKX6B01Dm0IsNK47+4iOU
	EPyavjFQafTrcMTmppKbb/jJA44xh+IfxBRFoH+XH7OMN48Ojcr1tQdzg5qj8xiTRmlYaI9X/+i
	RhIDT065psl4Y/VvsSIJc2iC3StryjQjXkg3GoyyEgDufmPmVJhtdRgscfomQZPqfMUfw3EPfvu
	eJHce47gHoL7E47Thx34DyJgMt4/pPh+ciOODHrp7DqqW0EsGNUZJYC1wCCfzAA9jUNXm477Ni1
	7YgKAoqOgYN4kyOz3B2kldkH7lQJN7cG4TnhuCcngohmaDAyDStG8/4MnhGHpvwuaGO2LKx9vdH
	TCQ6dJfxSDyvH2cZxEPd0CFPP5ozBNQjHEhOzSZ9GyxA6+tePq2RWQEUHb49JSOWg31sukQj+lV
	9u4wH4ovbAoA+IdJt/KmRL2+l8iv8A3mcXc27D6zi/fQ4pzzgyXaVPqspgqrOh7dLrbv8JXB0ae
	IaGUG5AbSXTb2Buq+3Btd2b/MHN7s3AhIBhgVHOeu/T5jSLuAvYw/e8x4Y5LojiOFCGomWtQTSa
	fFaUcTJRCD0gzMpiwBA==
X-Received: by 2002:a05:701b:4510:20b0:1b5:595f:4236 with SMTP id a92af1059eb24-1b5595f4800mr1081274c88.35.1795164259605;
        Fri, 20 Nov 2026 00:44:19 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:18 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:43:57 -0800
Subject: [PATCH v3 06/18] HID: logitech-hidpp: manage G920 range sysfs
 attribute via dev_groups
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-6-ba39242d4336@gmail.com>
References: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Creating and removing the G920 range attribute manually inside force
feedback initialization and destruction ties sysfs cleanup to input
device release rather than driver unbind, leaving a dangling attribute
if userspace holds an open event handle across disconnect. Manual sysfs
management also adds avoidable boilerplate.

Register the attribute group through driver dev_groups with a visibility
callback checking initialized G920 force-feedback state, allowing driver
core to create and tear down the attribute cleanly around probe and
remove.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 45 +++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 58f7cf84b995..1376d5bc3fbb 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2752,16 +2752,47 @@ static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute
 
 static DEVICE_ATTR(range, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH, hidpp_ff_range_show, hidpp_ff_range_store);
 
+static struct attribute *g920_range_attrs[] = {
+	&dev_attr_range.attr,
+	NULL
+};
+
+static umode_t g920_range_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct hid_device *hdev = to_hid_device(dev);
+	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	struct g920_data *g920;
+
+	if (!hidpp || !(hidpp->quirks & HIDPP_QUIRK_CLASS_G920))
+		return 0;
+
+	g920 = hidpp->private_data;
+	if (!g920 || !g920->ff)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group g920_range_group = {
+	.attrs = g920_range_attrs,
+	.is_visible = g920_range_attr_is_visible,
+};
+
+static const struct attribute_group *hidpp_dev_groups[] = {
+	&g920_range_group,
+	NULL
+};
+
 static void hidpp_ff_destroy(struct ff_device *ff)
 {
 	struct hidpp_ff_private_data *data = ff->private;
 	struct hidpp_device *hidpp = data->hidpp;
-	struct hid_device *hid = hidpp->hid_dev;
 	struct g920_data *g920 = hidpp->private_data;
 
-	hid_info(hid, "Unloading HID++ force feedback.\n");
+	hid_info(hidpp->hid_dev, "Unloading HID++ force feedback.\n");
 
-	device_remove_file(&hid->dev, &dev_attr_range);
 	destroy_workqueue(data->wq);
 	g920->ff = NULL;
 }
@@ -2848,11 +2879,6 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	dev->open = g920_input_open;
 	dev->close = g920_input_close;
 
-	/* Create sysfs interface */
-	error = device_create_file(&(hidpp->hid_dev->dev), &dev_attr_range);
-	if (error)
-		hid_warn(hidpp->hid_dev, "Unable to create sysfs interface for \"range\", errno %d!\n", error);
-
 	hid_info(hid, "Force feedback support loaded (firmware release %d).\n",
 		 version);
 
@@ -4991,6 +5017,9 @@ static struct hid_driver hidpp_driver = {
 	.input_configured = hidpp_input_configured,
 	.input_mapping = hidpp_input_mapping,
 	.input_mapped = hidpp_input_mapped,
+	.driver = {
+		.dev_groups = hidpp_dev_groups,
+	},
 };
 
 module_hid_driver(hidpp_driver);

-- 
2.56.1.750.gf70dc682cf-goog

