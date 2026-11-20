Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205331;
	b=vsL3EuR+sGNFZScWiyfRgyuIWdAmdBriRNZFwAkSj/Y37pA8t52fYWQLDG9h0YVX9q39
	 erW8YxC+3HkvhyD6uucrmFqlx2tWaSBV/zDIUyYptvuTfBjPpC22/ywf1ENPu96mPwKUP
	 +rOtOVEtFsRUCdIqzklBg3y5dOXEFMXCNKzYiKr+SfRlFVAdNyPTmG0KGjopFNxlkjevx
	 WpwToHRYD/CPJqnZ7t3IZvSUKds8C5UdQVCBn9uxhtLB3o8LI1iMPafmEQkeeJxmXFPk7
	 yqF8JtwOvnzqUKX89UNNsVJorOUUNBGUvIfHvDmOXAlVcjnqfGVbH7wM0GzNJRKLWvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
	b=nscKo4j7VOb+UQ9ZrdWEfUx6muE5k7nVWJl7nYegrETbQjOAVOgnP4UiKBpxQJz2Ocxv
	 7fvr3gDBNxq5rm79/GlXtOUi44C9TjzB2dNyxEe2v5eQRf3by/xktLFKR9HiyR8HWBnet
	 EB2YbaAqrLAPT1snQDxPv5Gn1IgOLvyFNmCtQUe2FiVYxnziF9zgueRFGJC8d2QparP8A
	 XCWMSwkyU2/GLaaeHqKFUkJ9ErPme2hzQ7ae9YnJYKRGA2eNJjjb47hw4lWQOcbIki2ds
	 A+MDloYpxLAJ1klYC4ESTdE6WIHi2qKjfLMqRGbAFhVr7TSvYoF5wZVedp44c7wpUkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svqos5rq;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3FB60A2636
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3FB60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svqos5rq
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-862b3938d98so662665a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205328; x=1795810128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
        b=svqos5rqjNX2lI77EqzOolQKXTy+0jVL6mdVS3N6fA6YoiuJWuLW9UwAJxEpePYXrV
         2+3dg8azfy1NwgA3X+w6g2BIHW4t32REnbwmrqEbWxgYlaeax0eZO5iye8+ZTE0CXeds
         I0sVYgC3Fsqc9YXpdp2qqRwVg2EEJYImoyyZPwLXq+tLTLpeANGMyqteMotdzlNGt9CZ
         CI+JiTaj0uBfpXg+NSLe78KOJcc95IqXXc91fkOEuoyYXgGCkLWlRTVQY+fJgFZWzZbP
         RIYoC1M1qt9GPFmRUCpHWcLBp3MZE+kzR+HvjV2PaV5uuRc1h9+x5JFWS8fuznszZ3vG
         w6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205328; x=1795810128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
        b=lkEDs3Brl3/DJ//qS4HNKR6ZiQXDyqoenQcqspaKrqpUsOGcIMGEdEHbPA44TnR3+Y
         oMi3ckvpV5N3SHvufEEkBiXgIz4MfN3UGWn0s5vBFDYee40Zlsa3HSBajyWHEDSaiD6w
         rVbDYQA++IkqrMn9ayUg8Lrt0uVxd+qZnMG1gwWnNzxSk0avc4ksjK+pV5Pidr6PXv1d
         Ks9OHdsJhC8sTBPFawXlnwR7I3G0vd5BUDHEp1VU6tlioXJh+JCjDoLXDYTBtdRpG2AV
         9nAU4wZ4fQOokvkw/augxBuI5+Hixsibi4tU9rTHpMlQaZJiKM93Lx6n3OdMovjYWxJr
         IAWQ==
X-Forwarded-Encrypted: i=1; AL+hErGVI6e14HtCmLBu+ESVdwnNbK+Th8/1gkAaguNHk+926pCn6YNi24Hmm3PZ9Kx4Gkg57Hqs6ClOpiP6X2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nuaXp4zz1f2HB2Z5spXqL34HNzYPsQ1cf59HATZwAKWRp9CJA
	GOc4eD20G2smFE7Y/VfpIp5ZxcJiHJloVz+qsJCFFHNep3p4Me0+e7SI
X-Gm-Gg: AYBFou0dAlNWqpGV3h6t+gBvWDQkWhQWb3aT+lNXnNkduEkWr0JyRtEX0WGto9o5719
	3pXARb/Q33jMgPAyfPQa8fDxsCjLXrCmjV5Us3z2GCu1I4v56sEGJMAp2NoFtMNkqAxNkK2fyQY
	nPNVdxWdmVDr2idp8T/44xxyh67Qv0l2cPLJp7SbRniz9lpLUffps0TaBVrTD/6HFQwyBFZi26V
	x8sGVSmAsZqqFv+vkJb8zenAHO8CWdKuOTb2y6PC+vTZcN6Z7PbGjojZ8FybSaew9tfrWsdQa+B
	EQ6RdZiK7W6bpzVSrSbFhCynDLp3EBy7Qda5+16g7gTGYPJtGUFtVrGtiGpxnh6X8dxrYkGqb3X
	lwJXffrP+89y0byJfF80UMUxSutP0AsP5a50h2L+qIDv/L35BxEOVG0VjFnc35xErOohAoFFPYo
	7FUSZZgl1hzg0y8HOhGYB1J/UMlGfidRiGOO20qoN1urc7nYzHyL62lZs3xltTvf21hYa1CTBxE
	KIHX1vYmdniZXIu9xbXRHw9Fp9oZey4A7nIwvLW9sLb1YWoa9BpqRkYb2VeCy0PHNgGu5tK5qyW
	D+/L1zXT23FRNzQKJ0LL8zOJx+uCbrXuOMYX5O70KefjPqEYk1SCDcsNsmLhBpcNAlX+ogeZb0X
	Oa78lAeBojsrda+uFOLsQXX1qBJ+EJGs+BnbsPCmj4fYVRluW/DRWBVRTSQTHxrtY0TLnmM/bxy
	6uyysZDx5zE+J3ctDBYBiQti67tud4gZ/EpsaoHnfoAinx9cat2lT2V9rynj66o5JrGoIjGHjUS
	w==
X-Received: by 2002:a05:6830:2709:b0:862:c9e8:576e with SMTP id 46e09a7af769-863158eca20mr4709854a34.21.1795205327698;
        Fri, 20 Nov 2026 12:08:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:40 -0700
Subject: [PATCH v3 10/11] nvmem: u-boot-env: propagate cell registration
 errors
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-10-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The environment parser ignores cell registration failures, so allocation
failures can leave a partially populated layout reported as successfully
registered. The OF node reference obtained for a rejected cell is also
leaked.

Return the registration error and release the node reference that was
not transferred to a cell.

Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/layouts/u-boot-env.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index f1fb206846ff..83c687e43e5a 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -55,6 +55,7 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 {
 	char *data = buf + data_offset;
 	char *var, *value, *eq;
+	int ret;
 
 	for (var = data;
 	     var < data + data_len && *var;
@@ -79,10 +80,12 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 			info.read_post_process = u_boot_env_read_post_process_ethaddr;
 		}
 
-		if (layout)
-			nvmem_layout_add_cell(layout, &info);
-		else
-			nvmem_add_one_cell(nvmem, &info);
+		ret = layout ? nvmem_layout_add_cell(layout, &info) :
+			       nvmem_add_one_cell(nvmem, &info);
+		if (ret) {
+			of_node_put(info.np);
+			return ret;
+		}
 	}
 
 	return 0;

-- 
2.53.0

