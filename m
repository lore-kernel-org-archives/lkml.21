Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105479;
	b=ux0zjgGVkBZS6wj1737Zv8Ca2wzRO5qQhC+lQN9lwLSAGVpheP0GSpNYf581+NEyUYEz
	 bWDOiEgzrQw2j2yhdVMQ9UGyZVVvhRPbyiDIp5IrMQ3kpt4fYFaZ0Si2vZmanYbY6NZRC
	 O9n1LlWu4cXZrJtLtzdBdOrr7AnjysWdkYea2fbQFu7RJ/jXQoojFV4Acn8pOvaMTFBzW
	 aVFjtH+UuoMSZhPqvqDoI/r7Rd7hZttYTu2H9yndpZGLtyQRY1UdsVwD4oq64idsb5TIH
	 kvhPUxFtL3aQVDss0gxHHI7oKNe5nGShpyAwYWH4WyXMxUqRDKGh2SNVP7MBtTv+KBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lsB+BaEFTRj6WfPSLmY0ldBNLoRsO2D6mQEhh6aIV78=;
	b=TmB7wQ+UyzGuYc5Lrh4lWAzrS4BEU59YV6W3M1Ea+ojghVu+rx/IP/wlReQ6HExrKhzl
	 sJjOoVcWnwMBq/K4XiXwlTkbAutxacGDrTJzoDmOEXQs6vPQxocSv/4Q0YqIEoeg0ib8W
	 YrZ1kQmGDzsNZpHAaVmFk9j27kKrKEp+pAvPhDPebLtTxMsTQ//w3b0QTj6kyM4/LTint
	 /0qp0k+ORn98VBb9zB8Tzx/a1LeLUAogu+cV1uuC7TFVdlVkNYQm/gX+8/XexxG6PZybe
	 Ot5XBHmn+VrKsthpMkOHoYfQiks5II40UcbtQAgen0EoB+grCpr6gKLr5MH5QZOKu7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f1AR/hKm";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD46606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD46606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f1AR/hKm
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so3723296c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795105478; x=1795710278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsB+BaEFTRj6WfPSLmY0ldBNLoRsO2D6mQEhh6aIV78=;
        b=f1AR/hKmtlEekxKaPQhGOtHful68GvhKyAU50aCu08DvR7x2PvERCoLwBvSQ56ov60
         uKkvQGydOP09R6YbxpdklIKFA0IqHnFlADIR+SQ/4S/6xFdmIICWkekTfOuIvO03s5dk
         HXKLFac/fmwNoPLWSs3LNt3wL5T/KHgaB5AjIDWRdvjmB6CTiO6gfGWhABxhPof+Vfa/
         UtlMUwoerXYgCQG3s1bLkxIE52GDY4vq6rh4KugZfnc5aJPgDnig5BW5cPT7HpcZTZ2L
         nIppkSWjDpa6PIznZu1aZ3NuRlD9VtyJ//8j/hF3me5LyZXyKbGUWfkLukgWESD8+W/b
         j6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105478; x=1795710278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsB+BaEFTRj6WfPSLmY0ldBNLoRsO2D6mQEhh6aIV78=;
        b=tdjOgN2HlQIGPM8XPJEptDrwKqFgIWYdyi89SjVphDuZiz/qU/3ehNO0dK8zE48xjX
         1C3uEqUOSgjV3T7GVGYwrJMNZJiYQyZZ/qQRFgtogPV5KuJqKk26tuac7X9LWbN0vpu9
         Rblg0Ge1HIO/+ftMlhuBbD/GM4Rmh1jkPyoPGzOsdyDLWBhKV2LAnFhRig5X6Q7SeIu/
         9Cu7GXYRaW0wEmx0S3qabWwIDTXCZCDRu+P+C3qbfdrnimE0E0s8bYQV+X/KAqlSd1Gy
         bqDt5lKwZuAjgcARmgF5H7PK9e8r+2lTzEJgyvf8uh6WG/SoZdk6NL+/O71pHWHITchh
         mHWA==
X-Forwarded-Encrypted: i=1; AL+hErEoTv2u0nai9pIN5hO5/tw9VHZ2OzhrdkiWDWMkYMhdiRDh6usIy33K+EWfJpnpFj6/uZb82l7Yvi4fWEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ycim3kcaAmo8zpMahIenXnFGAgN8rjGet2jVd3ZCS2ZpDp62C
	Zfa74n4+z8Aov/hBCyOFdI36jjmsR917Ua6/Nki25y0sRNDXPIDV06qMijk8x+tWl08=
X-Gm-Gg: AYBFou02B/eSI4BlgWvjSZByy4/LKT35KVnoNbIJkw25bpFFUgu5i0AbcpkY9ERNJMD
	5yWQQBlXZGJY+/nz1Mc8oQSVcXdJgDYCQR5WNZS1S6eHimiOCqT25l7HNgNez7A7rKP/SN+9uTT
	1BDfa2pkODVF/jtbz47GyR2RV4bu4IJcR0QrTz4qgOVHc2C/Hx4pQIqKd3zWPkPhGTNis8QWdsQ
	TpvALRmFdYhwZ8EI9JDqC9SBN01nRKOejVzA83VD5DhNERB3UMwKOrkaEKYZDL0BnAhMczxZfPK
	hv3Z7NvGu7oKaVebr1kLXQDI/hHaVloYzSwnTl2DWFtbqKkn1dOKIId3CWoykUQX7HtbUfdUxy8
	6cVvYqvHX4ObZ3ZmnC7LDPSTbEqtClp1XL88bjoKmKywcvQD6XjPJbu2AUTBzz+3G9BGdfaZQnm
	b6awkYkG09GvPqP9Q+GS/eIg4J2ty5ceTJlQHUdHwTD3nMOpSOG1RB6Zs8C1efdv5LEksoFAYt4
	015BxqHPr75S7Y5zH03ccS7s8kToE76HpO7bAcTbuB49ZgTZqYhH6JPscIro3I2A/IsnA++T+Hf
	b7pI/JvW8cfpVn0Sig78yWwz8Rug1CYpUC34GLYa4h6d
X-Received: by 2002:a05:7022:e80a:b0:1b3:b8a2:825d with SMTP id a92af1059eb24-1b5567f681emr195885c88.3.1795105477660;
        Thu, 19 Nov 2026 08:24:37 -0800 (PST)
Received: from evo.www.tendawifi.com ([103.98.7.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm302840c88.8.2026.11.19.08.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:24:37 -0800 (PST)
From: Archit More <architmore303@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: Akash Sukhavasi <akash.sukhavasi@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Archit More <architmore303@gmail.com>
Subject: [PATCH 1/3] drm/panel: newvision-nv3051d: Use lowercase hex literals
Date: Thu, 19 Nov 2026 21:53:51 +0530
Message-Id: <20261119162353.12962-2-architmore303@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119162353.12962-1-architmore303@gmail.com>
References: <20261119162353.12962-1-architmore303@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert hexadecimal literals in the NV3051D initialization sequence
to lowercase.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Archit More <architmore303@gmail.com>
---
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 286 +++++++++---------
 1 file changed, 143 insertions(+), 143 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 38d49e1d27a6..013d94e7ce6f 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -51,108 +51,108 @@ static void panel_nv3051d_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 	 * documentation.
 	 */
 
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x01);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xE3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x52);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe3, 0x00);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x40);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x00);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x03);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x24, 0x12);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x25, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x25, 0x1e);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x26, 0x28);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x27, 0x52);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x28, 0x57);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x29, 0x01);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2A, 0xDF);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x38, 0x9C);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x39, 0xA7);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3A, 0x53);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2a, 0xdf);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x38, 0x9c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x39, 0xa7);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3a, 0x53);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x44, 0x00);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x49, 0x3C);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x59, 0xFE);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x49, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x59, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5c, 0x00);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x91, 0x77);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x92, 0x77);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xA0, 0x55);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xA1, 0x50);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xA4, 0x9C);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xA7, 0x02);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xA8, 0x01);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xA9, 0x01);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xAA, 0xFC);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xAB, 0x28);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xAC, 0x06);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xAD, 0x06);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xAE, 0x06);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xAF, 0x03);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB0, 0x08);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB1, 0x26);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB2, 0x28);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB3, 0x28);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB4, 0x33);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB5, 0x08);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB6, 0x26);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB7, 0x08);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB8, 0x26);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x02);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB1, 0x0E);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD1, 0x0E);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB4, 0x29);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD4, 0x2B);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB2, 0x0C);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD2, 0x0A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB3, 0x28);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD3, 0x28);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB6, 0x11);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD6, 0x0D);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB7, 0x32);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD7, 0x30);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xC1, 0x04);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xE1, 0x06);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB8, 0x0A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD8, 0x0A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB9, 0x01);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD9, 0x01);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xBD, 0x13);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDD, 0x13);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xBC, 0x11);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDC, 0x11);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xBB, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDB, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xBA, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDA, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xBE, 0x18);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDE, 0x18);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xBF, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDF, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xC0, 0x17);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xE0, 0x17);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB5, 0x3B);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD5, 0x3C);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB0, 0x0B);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD0, 0x0C);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x03);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x00, 0x2A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x01, 0x2A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x2A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xa0, 0x55);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xa1, 0x50);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xa4, 0x9c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xa7, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xa8, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xa9, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xaa, 0xfc);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xab, 0x28);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xac, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xad, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xae, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xaf, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1, 0x26);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0x28);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3, 0x28);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4, 0x33);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb5, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb6, 0x26);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb8, 0x26);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x52);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd1, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4, 0x29);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd4, 0x2b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd2, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3, 0x28);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd3, 0x28);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb6, 0x11);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd6, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7, 0x32);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd7, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc1, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb8, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd8, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd9, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x13);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdd, 0x13);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbc, 0x11);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdc, 0x11);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbb, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdb, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xba, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xda, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbe, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xde, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbf, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdf, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc0, 0x17);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe0, 0x17);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb5, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd5, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd0, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x52);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x00, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x01, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x2a);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x61);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x80);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x06, 0xC7);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x06, 0xc7);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x07, 0x01);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x08, 0x82);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x09, 0x83);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x30, 0x2A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x31, 0x2A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x32, 0x2A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x33, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x30, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x31, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x32, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x33, 0x2a);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x34, 0x61);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x35, 0xC5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x35, 0xc5);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x36, 0x80);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x37, 0x23);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x40, 0x82);
@@ -160,80 +160,80 @@ static void panel_nv3051d_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x42, 0x80);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x43, 0x81);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x44, 0x11);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x45, 0xF2);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x46, 0xF1);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x45, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x46, 0xf1);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x47, 0x11);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x48, 0xF4);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x49, 0xF3);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x48, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x49, 0xf3);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x50, 0x02);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51, 0x01);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x52, 0x04);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x03);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x54, 0x11);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0xF6);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x56, 0xF5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0xf6);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x56, 0xf5);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x57, 0x11);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x58, 0xF8);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x59, 0xF7);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7E, 0x02);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7F, 0x80);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xE0, 0x5A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB1, 0x00);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB4, 0x0E);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB5, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB6, 0x04);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB7, 0x07);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB8, 0x06);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xB9, 0x05);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xBA, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xC7, 0x00);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xCA, 0x0E);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xCB, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xCC, 0x04);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xCD, 0x07);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xCE, 0x06);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xCF, 0x05);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xD0, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x81, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x84, 0x0E);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x85, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x58, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x59, 0xf7);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7e, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7f, 0x80);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe0, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb5, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb6, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7, 0x07);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb8, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x05);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xba, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc7, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xca, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xcb, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xcc, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xcd, 0x07);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xce, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xcf, 0x05);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd0, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x81, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x84, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x85, 0x0f);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x86, 0x07);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x87, 0x04);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x88, 0x05);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x89, 0x06);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8A, 0x00);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x97, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9A, 0x0E);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9B, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9C, 0x07);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9D, 0x04);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9E, 0x05);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9F, 0x06);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xA0, 0x00);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x97, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9a, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9b, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9c, 0x07);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9e, 0x05);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xa0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x52);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x02);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x01, 0x01);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0xDA);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0xBA);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0xA8);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x9A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0xda);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0xba);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0xa8);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x9a);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x06, 0x70);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x07, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x07, 0xff);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x08, 0x91);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x09, 0x90);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0A, 0xFF);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0B, 0x8F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0C, 0x60);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0D, 0x58);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0E, 0x48);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0F, 0x38);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x10, 0x2B);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xFF, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0a, 0xff);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0b, 0x8f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0c, 0x60);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0d, 0x58);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0e, 0x48);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0f, 0x38);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x10, 0x2b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x52);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x00);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x36, 0x02);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3A, 0x70);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3a, 0x70);
 }
 
 static int panel_nv3051d_unprepare(struct drm_panel *panel)
-- 
2.34.1

