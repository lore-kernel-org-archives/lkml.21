Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164063;
	b=nalKuw/sMDFzu3zsWk7q0i0xjInUA0gQFnQS4KxTWJX0gekQQfUo24C1dxiBo0pzBE87
	 Gp7iJzzsrfVNga0ft05qaSejl0EeBJrbud7kY/zQ7ya89PP0gNH339XXS1SAdjcWlp9zD
	 lUMj36FjXCVdcnVq2gy4Ap4n1r7hSz5a5eVjR8l84gOSjUlDFGPhO2dJ+XRp9UO/myci0
	 D1Yfzxaz6WehjAkBUnPEEAPmAOAs8VLyzzqG0pvoclWJ6+CyTZhzh7MDVDLzVif1eORXB
	 UAjb2tRwJygQQGR0AsdxKCYE/u38Vx1LmqffNMJuPUk2xUabDZtYDJjfNr4XTaVP8Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qt1Ybyqn6dGdqD6Fu8N2/lYm0CmAcHxTPwGIdEQURII=;
	b=Q92VYMAiWZ+8Y5uUdGvSEJ2yED+hac+cMGoHVAJf+jRpBfyVwIKztkjj87kzU7dIASYq
	 WISv0/b0npRQKqMUgwzMJt3jsuin1PUqw7FhrqOjtV+qGyPgGqAjZhVbr6yLDsV53BZQm
	 Sfjy8Nnptwv0HoIHcJ5A/jvbQeSHqTD3jcCaExH/SAtEv+Fr32OLaw1K4lUgyMrYZBXMu
	 EysRR25ny/e6xEa8GrKMJ/eEg5Qp1cC8A0+Ub9J5C866js6bTbL6pPJQEpeVhFnWZXbin
	 4MP3AokyP9eIUZ9X1GDNc9TBPolUoXKETfisX7jeJ0OqtvgmHSfkE4CQxmggBEw1vMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FNBO5qbH;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0056560A2633
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0056560A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FNBO5qbH
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385d8a00598so493612eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164062; x=1795768862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qt1Ybyqn6dGdqD6Fu8N2/lYm0CmAcHxTPwGIdEQURII=;
        b=FNBO5qbHu5un6qZDgqdgOTovjvjk1B0NCyZz8G96RXegY/7Jj2TYhD9gbeXWx6gRjf
         4/xKNjdHAozARhc9/qHe3nYRcuTxe4wIX+31WM9TneaJranELlCDCBxpgQdvJZnSmZqD
         XH2l1Sl+Pw6UO2UPeO11gCUJ4Fu2lJqgg5GIf6KvAjuORAwP9CeCO0oNYh/EUqrSBnh2
         euFi6JLkmEwdd97PPb44xKzZ3pFZlHGR8ZtTml9T2kdAG4kRRu7DwiSrCBVaGHyqKJ+1
         fuqV1aisW32oPFAlAkbznbZ1Jx/DK6oq5ItzHOYTnkL/5XZJFVouy1gtaaQVy/oOFgAK
         xREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164062; x=1795768862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt1Ybyqn6dGdqD6Fu8N2/lYm0CmAcHxTPwGIdEQURII=;
        b=yj2h9ZrGNBkYgzXn/fLI3j0xl0tDun8o4f+G/Tfv/zOpjiuq4TQ6I/+2ZsKu/Aoh31
         74+RzOkkjj3lG8yAMW7uw/7O+ZRjdeWozH6SESCsmtGvqIe7l16g4ktI5uP6gp6L2l1O
         ND2DEadv2dfXfsa/4VK2jJ5vfDGJk53D/bNz9r9qy/1Ikbcc40ezRSSJLvaO2dZTv8O1
         6oeXEfMro/Bzy/DibwDyqZOZX9VLixh59dknn9/zdaF5BR8x0zdONycr0bncyomRhLuR
         NaVM50MuITiAMAfMcO12Tg4B2pFghVom1ta4/G/FzJcuxKqvOkVQIGuh0cISIiAWcUDc
         vs3Q==
X-Forwarded-Encrypted: i=1; AL+hErHnTUEvogUXlZAmSZXA0xCrS35nZcbv48aeY46giSl4GbVpPSeCqNgPayyPeKaBrgc+3zwt+lWM59W7QJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MGa8tvQ5yvEMqnO1ARd7igBUtIeP9/BiZJ68/rRqc00ZqLYgu
	1pwVwD5UNT8rQHvtL5psw5HtBgdipMNCtjdDF0k0EoI7HLUJ/MejZUOZ
X-Gm-Gg: AZFdTZc/dd4F6H8o/6CF8rpgxYkP8hAJMSJl/JCgMSDrFi7PcJS/d9QvKZoUziE+ymm
	COZ6eY5mx/Df4DtV6LuK18BFDB5+US1i4Rz5gyq93IWcGz0nN5k+m/3iAGTcSbcftUQ8zzqlj6u
	mN3N/HWcEHJsO96CkW6BH9hhIvIRut0/Km+kRJpEEUJiK9dJyekG1Tz1EsDw9IHzjP06wsj6zg/
	Clc8Cn+YwqrdpExHR3vHEwjU9wugROp58eExY7tboQe1QZtcN52LJ1OHff68gLE37mcPFoVNvPb
	qqb6AVvVrh9PhsUSEbKDrdpYblsMBbZdElbgF3UH0rrjFTeDk5hSP0cn1P2JrSJ/okEYvi/i0Mo
	Mgc8o/07emea5xs6Oj8ogZv+M1TRLQr9YKlSfh4YHyHRT+JhViBVixuFrcJqbggk/esUbbZOxad
	vTX4XVUfRaOosgLYAtfetD9y7DrctBxxDABpw0bNqfaGcp2bP9b/IXewOpEYdJqwIlgsJpugCm3
	gJiodk5sgHuNZ98ELtjJsLBsRITlUi8QMCA6qzQAVUHCLGntaPWrzN6LiGmmAPtB1iwqTGnDG/m
	T0rgSB7qEmY4bZ2rUKDYIOKV7TCykZhXG0YHz+N/PC/IJrBKfAY7zNenhKgtSX9fh6qAd1lxaG0
	Rhn4LYOdVvjzx0jScdw==
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id 5a478bee46e88-386565b529dmr81358eec.36.1795164062085;
        Fri, 20 Nov 2026 00:41:02 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:01 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:51 -0800
Subject: [PATCH v3 03/14] HID: logitech-hidpp: drain G920 FF workqueue
 before closing transport
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
Message-Id: <20261120-hid-logitech-hidpp-v3-3-cfe2caa1d0eb@gmail.com>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Probe no longer keeps the HID transport open indefinitely, so the
underlying USB interrupt IN endpoint only stays active while the HID
transport is held open. When the last input user closes the device
after input core flushes active effects, or when the device is
inhibited with commands still queued, releasing the HID transport
shuts down transport I/O unless another client holds it open. Queued
force-feedback commands then fail to receive their HID++ replies,
causing command timeouts and leaving stale slot mappings behind.

Override the input open and close callbacks once G920 force feedback is
initialized so the force-feedback send queue drains completely before
closing the HID transport.

Fixes: 91cf9a98ae41 ("HID: logitech-hidpp: make .probe usbhid capable")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d9342a3e8122..d5f53b35ac6f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2815,6 +2815,22 @@ static void hidpp_ff_destroy(struct ff_device *ff)
 	kfree(data->effect_ids);
 }
 
+static int g920_input_open(struct input_dev *dev)
+{
+	struct hid_device *hid = input_get_drvdata(dev);
+
+	return hid_hw_open(hid);
+}
+
+static void g920_input_close(struct input_dev *dev)
+{
+	struct hid_device *hid = input_get_drvdata(dev);
+	struct hidpp_ff_private_data *data = dev->ff->private;
+
+	flush_workqueue(data->wq);
+	hid_hw_close(hid);
+}
+
 static int hidpp_ff_init(struct hidpp_device *hidpp,
 			 struct hidpp_ff_private_data *data)
 {
@@ -2897,6 +2913,9 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 	ff->set_autocenter = hidpp_ff_set_autocenter;
 	ff->destroy = hidpp_ff_destroy;
 
+	dev->open = g920_input_open;
+	dev->close = g920_input_close;
+
 	/* Create sysfs interface */
 	error = device_create_file(&(hidpp->hid_dev->dev), &dev_attr_range);
 	if (error)

-- 
2.56.1.750.gf70dc682cf-goog

