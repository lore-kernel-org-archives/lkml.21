Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944309;
	b=pb+mkQO3AeY4HTv6LFsFuqm0qbl8/mofNGVe0sHvRg194BBA5WWAAVymGHiZx1x6L/NC
	 +E9oMKsA8GAIu4F+2LIkHncKnIXMnDTap1tStKnjRpubuL29jXfuKknK/SBnNjzHt76cX
	 WBpt3mu9mQZI5BVRP1z+HFwKlSCltsTeg4cqeYDwHT4ubdc5Kkn5wdcMhOUxyT4I7ZfwC
	 /0nz8FCJF28yjfkD2f6V2iddp6r2uEgWv8HVtnRvFIHpxoMt9487CAKaYw5ZcVKiB/ceR
	 tCVHzCAsvS2ySK16LEjlfgGR+gmZjIW0MCykoHSnUPpj6IYOVo4gbeuwKPOp7hJoYLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+eAGOxWFaa2a5JyiXtLznZ+QwzFoe3T3DPshuhjNzj0=;
	b=BNOsckVUcyZe9zv9TiquGQWVyNPYtZcEYoSKRoaXRxedGINyKvuvBQizKQhEHB8pmdn1
	 ygtFgbg5dSFbSu01EzjsIBinaOTFHd6pnS+sAXy2lLY6gRYghE4MdFxbiJA6t99mxPraJ
	 DA0SoEvr8Dyz3mqe9SmZHKCvaZ7xhCyxleMr0W/s49zdD249R7d6Z9T1gVJ1F7V4vypud
	 cb0/BTLMPxNPsypnjI3kxUbOg0IGVTwUlnUcOblkVIwxFsa9cjpSb+wnuzmRZUPwYuA/T
	 o26OVB+1+ivrQYQvnQgebCEmRdYJELY5BEc+uw/MrGlgFIeyFqwIy8jzcYvPLsi7lsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnXONejq;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37777606A889
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37777606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnXONejq
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71acdd32a53so87321eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944308; x=1795549108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+eAGOxWFaa2a5JyiXtLznZ+QwzFoe3T3DPshuhjNzj0=;
        b=MnXONejqPnhrhfL2OxeWsboj71fefujZLqwTNH4uZ5/fLlr1zoruE1rwRa6xIqeOk7
         k5Y7SAe1UxU4y7Pn2MkRWaU9ZDL57u7hLCUQQeZtnMBOGYlhvb8OMIKfzLSdDr4hySlv
         UZwZLY3XkszgHH4ykILLfMfbR/vNSdP6Oy7utoRRxfR+xKQ/wWwzKCnR5Ahn5ePlh7UN
         Ieu41XZfWu4LB4JJj+oS/9AoOufUj4zcogV6UY5+j36CJ93NmKaX3T95MDNhcFHdCk45
         LnIFkwBNDu+keEl6vONhisbdINYS5U7r6dfXIAFDNJbWwmOmMKm7kBODL8pTpe/FhWKn
         gWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944308; x=1795549108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eAGOxWFaa2a5JyiXtLznZ+QwzFoe3T3DPshuhjNzj0=;
        b=Zlcn84xKpn9d88vcuJvMsxZFtImE/1DYbB473LVUie/ibQ2BhV3/7p/UD9LQckngjg
         T7p4ItGr5BRNWVua6T8LM7Q99k0hhFdqGzlZUdw01nQWOH+c9lhs9h9vmcAfALKRPw98
         zPW71KMTEyvFRFgw7SfTJinnp6NoyWYV19++jiXGk9ZpR1xhanTnV0uKK1SpGWBCJcng
         Zz8DizOPaFQzGWS3Nux1ntqoHSDV/af8QMmAfc+/qM885KOSZFaTZG7TO1TyVjWngcID
         2JbuoJC3IaaqoULF9YJVCdJcnC7mTDhP23/V6XmBdZEeX87fKzlSIrtDPpkS8T9jL16J
         jrTA==
X-Forwarded-Encrypted: i=1; AL+hErHfzMJrd4DVqo29r54POBptTXm9mP6znkpiXGY9gr9TUOutp0C+P6dKABPM21SvQDwz51cEqdanB2xLDHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dJTnzAKlYS6PZPknqc+GB8jtrcf6dhThePBbl+TVcylx5GcXH
	UTshrNQZ2Vr9Bp4syuSNaXfulzXCYKkbAr/274WIZPBu1rKqfiRcQ6fZ
X-Gm-Gg: AYBFou0+Ye/tvypP36ULTKzDHL7TAqAp6N2R3Unud/9kM8W7nfanBfNDXA6XlygHlH9
	dqZaDsplK2j7fM4t6AuZ8neIxtS3pk0P3mAMM65RI0ypEbfkB3uLFPom64DCFwjaG9OGnOzK0Gw
	gZdf8Fg/a7uhHN/xZ6yC7cg/6roGODcnHsaZyFEU6ZgAuDxGtiv+geOrSh1mPrbhek4fKZhrYLW
	kmUyO07s95YUW3Hwk+1IjFRP2d0t7JCRl3FoIZsmnFEiDSLRuUNbIhC4RUOvKlTSLFJFZPzeNCV
	cXMIZy6CiH4Qqc2XbzSFjpWje8bzMunbUl1Cbu4YeO6sQiXfCyCdxY3BelKc9EZkihR1OZ8RDA5
	ePjavaRW62fIkzZiGAGb9BYVAobCzQxPX5v5yuK1EXR+AblcK7WmJGsGq698Hwok9NcWBtKODcK
	Mg6WKZf+oCEo9rXiVQMOWpdT1/gshNbq7bk8o0GarDE1yC5b4sIipVDKmJb9izi7yaAjBQntxmk
	7Cb8BTwkNn8eVMZTH3hlXndskAaKqrz7/lfEBvB1JI/VnxX9iLMGbNiAqTZ0FLf9DjjRejQo+i1
	plpRlDa14KRDQExzd2rJ7TSP+1Q3//0oqgCYLvOP250RpUn13Xcoh1js7sDr40GPMAnN2gYeOob
	oifR10x71/I/hdEl74tqINHmAxOgZTWKnBTwqavX8ltFyMnXXP0w+8DClbXJ+NP+WMunv0i0MZ6
	UsFZ4y8rsZbJdVoLdARiFlWhebj8Y5DDWw7Cfm2Zm2W4MoDuHxzDo=
X-Received: by 2002:a05:6820:f035:b0:71a:df0d:ea22 with SMTP id 006d021491bc7-71b18465311mr297652eaf.17.1794944308105;
        Tue, 17 Nov 2026 11:38:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:09 -0700
Subject: [PATCH 02/11] nvmem: drain keepout and cell post-processing
 accesses
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-2-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The register callbacks are protected by SRCU, but keepout traversal and
cell post-processing take place outside that protection. Unregister can
finish draining a register read and return while its caller still uses
a provider-owned keepout table or invokes a post-processing callback.

Hold the SRCU read lock across the complete access, including keepout
handling and post-processing. Reject accesses after the operations pointer
has been cleared, including reads satisfied entirely by a keepout.

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 802637f375f8..73aa53145f0b 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -164,6 +164,10 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			  void *val, size_t bytes)
 {
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	if (!nvmem->nkeepout)
 		return __nvmem_reg_read(nvmem, offset, val, bytes);
 
@@ -173,6 +177,10 @@ static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			   void *val, size_t bytes)
 {
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	if (!nvmem->nkeepout)
 		return __nvmem_reg_write(nvmem, offset, val, bytes);
 
@@ -1651,6 +1659,10 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 {
 	int rc;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
 
 	if (rc)

-- 
2.53.0

