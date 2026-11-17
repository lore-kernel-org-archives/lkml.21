Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944345;
	b=nCX6EKshFFAB3kkkAxYW5b5vn8lDkZsZTM4USz/785Yv89oDXVDrXSC6x2Cf5g7TK3u7
	 VLMpNs3sVpgay5mYnwyl1spQ3YKh7OID/eZ7RejeTyQ7Mzaf1KuHx/tfK+5Xg3No0tJ9I
	 yKAsI1MC3wzdKWgV536H6U0hISAcgwRl5f4UtzGuo5QsnQLGPEH/SsPGpR5AMj16TbFV7
	 LIDwu42pi9JWevjd+waT9h8kQ4u2Taj+xNCJrI1fBq3ILr2SqG/Sw6ymIWGvWpF7zg01m
	 OjXqaaJJLnUOVkI9UuseJWV1taS0yH5T5Mx1W5/v/aMp2oY36lhYMTARRpr5pRsBtUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=T+JSBWZUTfeeNWblhp3VV5bFP0F5yNnWU4+fvh7K/Mg=;
	b=Bhdc6FAJ+tVCH5effzmM9P4+WD6V6K9DgwIP4g9i8yaaXzkRjmbUSnDxfUVq2cWydBls
	 0zQxi8TSQB4830OYDr14u92PwawYNuQ8FXkfc59jY9N2Fw6Dzor1M++PwL2vMXgyMLDyW
	 zEMzcmhB6p6eg32zsKl3jQsSJBszesbKPpkE8BN/GKpT96xPIQJy0GLLvK0rE1n7p+OGt
	 M+ES/F8neQuM5c8SEwMhesJRXSbjNazWcbr1iBXJbDHmFfUZBZsfYwTpcMbzsAeAXtPEZ
	 9NZDuIy7o2Y8qPeOiHOgGLxPqr0jsPKtDYnmQnHgY4Y76G6XmuY0GcFWSD8Vi8HsLBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRoJio5r;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60DF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRoJio5r
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1afdf5196so77372eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944344; x=1795549144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+JSBWZUTfeeNWblhp3VV5bFP0F5yNnWU4+fvh7K/Mg=;
        b=mRoJio5r5zrVtmymxcx1HyubnwBahMEqrQ74C5DqSqEb2pJLsiBsh72txtplCTWi7P
         /ZsUKK5QJhdRuqBVjyTrQssXqfkambyEyhp3xNw8+lRrODcPZBegig/3jbWN2jnxRSbe
         IEfEGl4ErPDJjeiHTSdb1pMNSaACRWnM1U/dBQg5wlkZLkgCxc1oqwfX47hLo0mgSS8N
         6OOJFo3a4orZcoqPzRUcESejOsFRX0RnPospy3x44k9mgxa5WUGIKX/mCXgNk9NOZ+Mw
         JBX/+AP2/RBxNs7JdDsqrhtdkIOV0msFqlkDA9zNnzZXZMXDa4YWSGKAsndAgdDILiUv
         wEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944344; x=1795549144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+JSBWZUTfeeNWblhp3VV5bFP0F5yNnWU4+fvh7K/Mg=;
        b=MJU/9Ede2HOsNj25xgsINgssa3yuXUgrfWvdAj3UjQDCoNyjnX/OyyNp/rlWa8p5Dk
         NzuaS3UJdA8rSH8KdhXHdve1S+nxttSTIa/w5NgiAD3UjnD/h8uw0W4vtv+V/2AoFgOK
         ztPaKOilB85l5OrYEtDK5iOYQ5lhUlvcQqLmV/bGchf58T6LP63cDMs5Z6Ti8UjONeUg
         rV/+9Hh+4tPHOvGirmN9F0Tys7YB7noZhFlzln2j6Ixp+ECfBgyB1OR6JqCETeMJY5y+
         YnhAEbr2a96qF9k7byh+HcCMuYBmmqgMmKW8t+j+4qrzd1fpJiYdlC7pzApnkB7Pc4N2
         VzXA==
X-Forwarded-Encrypted: i=1; AL+hErE8cqZfFt7ZHtn1XcmpqhfhCZdaJDDf19hCts7kMTPuXVbMjMAYgHyCwFvINVNdan+O+aBdyYjHD4D0ahc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GPyK7jvHywzkZ1ZB8PwIZgjVM697NuajP6pS5sUpYUki0+mFX
	y/sPAaMEv8LYhPi7QRZ3/RGkR0WPh741f125E1C4p0dw0j15QnecsLwO
X-Gm-Gg: AYBFou1rPcrnIuOq9GQXYc55mdWlUAGowT8LB8ClH+x8loF20cMOXqsoGcDDYV2N0rk
	awL/WsFM4CpvdjjIWnsOu9UBjZQy7o3VvR3H/5EptUCzNVOOwj2c2i496dp+DZ+pbeefoAvoS8a
	sR4p0lIuvzp44huWbSoJPkdT/42asvc8FsDmnZqjysWloi1xaoq2GgjPl7r9rgriuAQ+RF+PilA
	Kuj69nQCSXESukOP8BqMqkBPqw9lCeOY77dPgUmbfvDPcZ3L4hc4Xg+SnmMWv6h7B53lnbjmJ/U
	zVUNQ2UkP5WbYsevYrbCGdOE4Ut8v69qfDl78D2kycSoZDOAFAKL5gaf49GnOBiWoe+bieWnv0T
	ovbFwXXZecrMeVPEC2SsN93pT2wWUA+wTin+/XR8xF6CfPQ95QSuGMi/nD6zQYYgrllWtZztaVD
	KHLZcZkUhK1AiD/xPK/t2ZUgSX2eGYcUUiDlH1MFyqIfVGoV6Je7DNcTmjQhLfqjL27ytrloNxD
	rbtW6berYCj+0DgGF/x2QPUQUnyeKh3xLaJezqMa9jEeOqqz/7LK7/AATLiX+/v27SvL8vf1DdM
	9+fbzHi8NIwxjz6+3VBzbTisLtO6eLqpV0gnnt2xANhHnE6+7adAVKpboSYs/beHe5Lt9m1yQTG
	DcLR3K51f9/ighDS0GYnccpFb4Bgnn7feE5xA87wmuGhi9Fx2mstVjeRNxydmGx4xJav9m95ah4
	tKKh3ahI58fAPHrhz14dIcR4kcCNypQwTEITHDVxxFuFVixqQd7H8=
X-Received: by 2002:a05:6820:a006:b0:71a:7b15:6159 with SMTP id 006d021491bc7-71b1858a8acmr220915eaf.52.1794944343789;
        Tue, 17 Nov 2026 11:39:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:17 -0700
Subject: [PATCH 10/11] nvmem: u-boot-env: propagate cell registration
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-10-3cfbd48812b5@gmail.com>
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

The environment parser ignores cell registration failures, so allocation
failures can leave a partially populated layout reported as successfully
registered. The OF node reference obtained for a rejected cell is also
leaked.

Return the registration error and release the node reference that was
not transferred to a cell.

Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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

