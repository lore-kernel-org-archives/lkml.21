Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672617;
	b=fIpLm5IMeoGqHRVG0Oc3iRRscxr1iqHXuOsZ4SHhtQaLme1FYWOv+UQZqMbByoX1WEgj
	 KmU94hqc8N1J+8h1ZvICl8hkvGToNKSuObyzSgXEl+zBBlDv2hPrJa8DjZLiPK0ELn0Gn
	 OQwcE1VaorGWfKIo2BScz2d63l0zL+LhdJHegJaqSXVdXjrSQlLKRblJW/iJKrSzQpWUl
	 oU5j1IyZwMeBUPsKRAdYTt2O8Lok6eEWYj+2NZaotPE4f0IzfEGE/npfdz5vTwnriLD+W
	 CRI8n9ybvFlgF5foLdLmd/E1Ef80aAqj9BgULZJxdKN+W6w4A7KmKkLVKol4WYykaYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GaDF/oabtnPz5CC+z3Y48KsX5H9ec5sap3k/VVqc69M=;
	b=raGq7iFrCcuO2DIMU/C2DIGD2gONazDncO4sAHv4JccWb9V8Fe3UGlW2fVACB2uzHFvM
	 Ecp7pAqyj7VLoW7aibvj/bBjdmT72XIWxgUeVp3we+nWg/q2rZncxVMUoHe9IsMIRfGr2
	 fS7DgUz/7dlIEoTEWckQNWZeRjD7Sjii6y5PZWYz0FwH1SBneswRQP3CdFgrk6M820njd
	 YMV4tlUnqGsY0iSVjt5aV0Er6vkEm0K1EQodu5i90jfdRJmDL8WKQU7PKHM4L2R9rVXqT
	 D9VWKJdS2y08ZtZcOxKZI+qAl+9CzDlN69xnGCzYiYsHffRfj8i/pGDyr4nxq+C2+pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggdGyTHK;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70325606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70325606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggdGyTHK
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386ab9ab619so8598698eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672617; x=1796277417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaDF/oabtnPz5CC+z3Y48KsX5H9ec5sap3k/VVqc69M=;
        b=ggdGyTHKICLNcWcMun1QBSRIj+w58Q8fDLAGuRoUVpqWwEYcJl+IxC0paMlWlrjzj8
         LkGy2S/7LOjq3cxbx+Gx8CPb9F24aCXiSNacF5N/VuvMLIc1qGO7kNqUEymVtJSVrYrJ
         btK0pCq7u4HBVGSiYT9T3NV7J1umh28GUfrkEpmjYVo8itfIZXcSOcfu5jRvnrPrCy3M
         7lsAwtRQ5AoUCgB5yL6MD+Jf0lmHeydBFXU5tefO9XjUv6B9bArbtDfpndnB0S5UwVHY
         T4ppcVXwvo82LuNSccQTzYmIEw9SH3NGX0WteqaLndZ3Rlka/hL03DlUiqyvgC8n3w1e
         Hqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672617; x=1796277417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaDF/oabtnPz5CC+z3Y48KsX5H9ec5sap3k/VVqc69M=;
        b=NELMipYJadWB4a3zSrrpPdb/FzlDnZMC7J4Z1+JyoIR9XavYXsP/fOzDtvYKg5+4B3
         0sBBsyrE7DaAfHU9YhQ/yeY8yQG5Tnep8g9s4Er0jRY/Jt1kou8FY4xhIAzHL3m+N/i/
         QpZUiat8DQBzGQaMYQ/iQNp025/BDrA9+4GPBIeMp96NhDn7dGJAwT0cLUwGL5Wb8bee
         Q8cISH1PUBwGyu93sMJT3YZZanN4Iluupt64Ddg5efrdhENuvwDn9zhbdukroYilYV2u
         4aK4S2og6VI53mhGhswGaR7U2mXlu2sGuzwaW6c+UUQmU4A13FGTXHod6NX+St3b+vY9
         ACnw==
X-Forwarded-Encrypted: i=1; AL+hErHFmSwf+vSAhB7sluPYad5R9fEHkMg5xufoPrflbJqBtS3KZm0UeT0CO0eyQ8U7Ov7X/Np/U3tAfH3SxeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C8TSzy6oLSnBDktD/kV7pPN5hamz8sqHwNUMO2vvmRU3E9eNn
	eyrsbmsgvJnzgFbcfX7WdkR5AANpeoMSbnKhx2jDUjCGeITg/1qS8pM=
X-Gm-Gg: AZFdTZd20deAUR1bUvc7YVtsWt3VNO4MJDbcLFFNM/Yl4ZSlm0IR72Mi1okG8KsquNF
	sQXTZ5+aozZOWWXJsRG6a21kFmhKdlDP6eQDKY82pbO5bq+ACh5BR3I5hs+TKH0o2nrEV1/xcM3
	GoPEO0w+EFFPtics49Q3QrjNf9rOXss/A3LbHq4iCf4S3UrWMAe10U+VaKqIlmc1a+qEOmbfwv8
	oYxsNlHd6tzhvq/C82V7mwYkM2WB2jRvoPmUzQK7q32GuOjEzXPn87PriNm3Y3VK1t7T70gG1qN
	uolTvg2pM6eWAgUo8lP/ZjRQsuYO+0UBV0e/8oQFH0CGgraL9usKS4aYyY+0eCbziZ1ABut4kPA
	muxwdmQEO4sOOY4ldaZW0JTE7s2GgHsB/OQipaw5oe04/rDAX6mk61a683Q9C2w9JztCis3z7w9
	rY+Taa79EF1ln+6fZBxIkY8JcZnPLtZLrcf/YJ9NHTnPbp+mbYA5P5cecvBqDqwgEqa9Qg1NqXm
	CB0O0oGybefmhXEv5t4+XjJ153gYw8o2mBK0zo1PV92dKog+/PxSWuxDemkf5Lj2mYC2xPcrFKD
	2eVXQ9wEnxJqTPgraC4ecYRG5Uz+fFqKkbFbOs9ey4dKPSpmS2hDj0oFSfc34VqKPi4=
X-Received: by 2002:a05:7301:4201:b0:385:b8f4:755d with SMTP id 5a478bee46e88-385b8f47ad3mr20537639eec.20.1795672616579;
        Wed, 25 Nov 2026 21:56:56 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm57523404eec.15.2026.11.25.21.56.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:56:56 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: tvp5150: Free connectors on probe failure
Date: Thu, 26 Nov 2026 13:56:51 +0800
Message-ID: <rc-b1-20261110-vc-28-73976feaa334@gmail.com>
X-Mailer: git-send-email 2.50.1
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

tvp5150_parse_dt() fills core->connectors[] using
v4l2_fwnode_connector_parse() and v4l2_fwnode_connector_add_link().
Each connector then owns a label string and a list of allocated
links, and each link holds a reference on its local and remote
fwnode. Only tvp5150_remove() releases them with
v4l2_fwnode_connector_free().

Every tvp5150_probe() failure after a successful tvp5150_parse_dt()
skips that release. tvp5150_mc_init() and tvp5150_detect_version()
failures return directly, and the control handler, IRQ and
v4l2_async_register_subdev() failures go to the err label, which only
frees the control handler. Each such failed probe, for example when
the decoder does not respond on I2C, leaks the links, the label and
the fwnode references held by the links.

Free the connectors on these error paths, as tvp5150_remove() does.

Fixes: 0556f1d580d4 ("media: tvp5150: add input source selection of_graph support")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2, W=1, CONFIG_VIDEO_TVP5150=y, CONFIG_MEDIA_CONTROLLER=y, CONFIG_OF_DYNAMIC=y, CONFIG_COMPILE_TEST=y; no new warnings versus the base object.
No hardware or runtime test was performed.
The path is taken when tvp5150_probe() fails after DT parsing, e.g. a DT-described decoder that does not answer on I2C.

 drivers/media/i2c/tvp5150.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index c889624..efbb588 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2158,11 +2158,11 @@ static int tvp5150_probe(struct i2c_client *c)
 
 	res = tvp5150_mc_init(core);
 	if (res)
-		return res;
+		goto err_free_connectors;
 
 	res = tvp5150_detect_version(core);
 	if (res < 0)
-		return res;
+		goto err_free_connectors;
 
 	/*
 	 * Iterate over all available connectors in case they are supported and
@@ -2232,6 +2232,9 @@ static int tvp5150_probe(struct i2c_client *c)
 
 err:
 	v4l2_ctrl_handler_free(&core->hdl);
+err_free_connectors:
+	for (i = 0; i < core->connectors_num; i++)
+		v4l2_fwnode_connector_free(&core->connectors[i].base);
 	return res;
 }
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
