Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803385;
	b=qcxu5M9147V3KWw9HSqkRRwoPSqbpzKgGXokUC9CzdqQ/GwF2eMv80mJBxDc3ABA/J4T
	 wnQTrP+HEPcMAXiJLiiof8kzVmxK8feQSC66ymVHSQO50d9ISaxvd3lUzW8OvLFMKgX4O
	 75lsPqA7yCZsjwgwJC0LhXyHIYs6V0XaJ0Q9q2TFhrgVgRmpP6Ahf9K57CRCBFwmWCpZs
	 VmF+kyp1/4PgAugsHvtiy9jfOLFlHi/DZJMfGyefyQxuFi5IKpQNCSU5RGe/x8b26CQmm
	 sYBglYi6/eqQc6nVDID+uTxW6oVIsHk13lXWrymZEPk0y1Qy/QvqOcIj2sAChkACSIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vWsF7/sGRnQcNHhIssCpGPPEwDUF/AFXvsQJ0lFQQ60=;
	b=P91BuZise0aJZPeSqxNGVrqzw9asllOqLLwnR++D3IFZ/Fw3cwn7azpcWI6MpgGFByPf
	 MSKUJnZkszqafxF4UIkokJYrfxJwVXIyokq878sNaPzKHxizjuRsPkxV5L5/omO+FE52c
	 J1WP9470x/PZWVV6orAMbiBKdnzIqEMyI5YNlcaqnaunsc6k8vuyPlEGfC9bBUneYxv6j
	 qpcnN6HrmKZchQRBrXi4Hl5z3Kk8uLRYeYNOGfIDnO1pPtpREmwciDWURqjV11j92lp8n
	 TugsWCXwn7k83+OjlQ6fLLky97cd53yCZjZkfZv6Uodg4CjdqKcfvcfRPPQIQAQPcLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHi2q+uV;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B442606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B442606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHi2q+uV
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so3471334a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795803384; x=1796408184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWsF7/sGRnQcNHhIssCpGPPEwDUF/AFXvsQJ0lFQQ60=;
        b=UHi2q+uV1ffsrnuLijpKghhT6ycHqr+TW0AKd+E3pY8Dqhxb4VvLl9SXLLLk1bdCZZ
         VYXZa3EDnOEL46nQCnG6bTuXsP4vt34Nuyjv73sFKroTVet0kO3GLXHExMGU507D0pdK
         7s8VCpts7qlxv4wxPabGXy2ZaSdCF8p+qxTi3u4Lh1B8QXElGAcAE9AykCM9LrLq9DYO
         JJPjbUqy7CSS4KXugJ6c/E/IvAvG/TrOYeK0QKNPCLVPtkhldMzxaw9ASIuJgurQIg0e
         02+YDt3+6+tFYTj9YZXP/pDhmrPkLCXZSmxc2K2QO/A5Khxs5Si0KuptV1LjP5O57G0P
         G0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803384; x=1796408184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWsF7/sGRnQcNHhIssCpGPPEwDUF/AFXvsQJ0lFQQ60=;
        b=a+gOmFZiRIU6CqbVNr87rwJnbvwGzzbPm+GEa6XfoVIqRv6n8w7rCXCac9OJk4zPSE
         zcNB5BzzvMYEOCdc6LVLcFVNanbw2hR5ijuxn9CWvyrrsJI9KYqqRwSlhcxGGg2R7qt6
         e2rS6bUdpqvNllTpsEvQS8y25rsRy5KF0ziXWTe1HmEAYnqdlKB7VKsSf94PMPZV+4BV
         fPbgJ43vgFUqVLYad3j0kFgmekJmRZuiQDc6qFqtoFFeuxpV+sGcozNXFSKx5LGEwSAX
         pDn97x0QZnxO0W5aeVgFRpLB+cqGUBwjXXlVBw4tzR+A1NeLdZTJrfBk/sEIDaZiDdmr
         pIhg==
X-Forwarded-Encrypted: i=1; AL+hErFB0aF+iq+4OSY5ASha2spuViBWs+Rm9vW9daI7zRd5WJe32/4cviMqEMDkVIEIoywWk3Mz9JFZCRPUeCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ws0Z2tCL4gOZ88xOVTUWLCtKL8ACDXs+qVFFMefVK8caxwdnx
	VyKosXgqAWzt5Zv47ZmA+ItnM0OpgLRxjwx/c0WuA4atULWhIvDjFAne
X-Gm-Gg: AZFdTZfwhKT4ULmGzEOeoW/RFmCYlFq8br+hlImNqqbcFpgV320kgDWpZumMv+ROWwR
	XPP/t04gnUZFOABapx+44x3BeczzxnY2axaXFIXfE126aRr3YCIuRH3S/FKdhyKnlcp/NT/d0p0
	IzFpYmyvE6B/FKIjwY/vfxy0Oo0jLxYIUBzrbNdRzOa4TOaXjvLUtBrRdImApcKPJupfwfd6d/l
	BDws6YocuOXVKonIYE6pkI3k9jzsGUSGJTb3qavxGbipRHEZYh5tuyNzDjYcNkPqBUPPhnFoUT0
	+ai+c/g811thM4gvAZP70EnmcbGcF1dmdaSY4x1TetWw9fGzY9mho7Mq+hkv+lXFKH/sQKz6nz7
	Ef7ju+P4dlWP7BK7/vLq2JTqCvHEPKAN+oQZ81I2d6+K3mvgQzeVVN9ZJRl9oFCIQWuwUR8n6lZ
	a+2V8VyvEF0DP0cB4KolUSjNDsNgu6GVJHX3p3YzIOprnNjhnHapY/M+qPcgvv37xY4bQxiIw9R
	pphvOHKntQ976JlYUvRgvEtnjbVyg0SUVhoR+6+SIN/Xm8lA1BdlrKQemshKdUePr/39VS8BYBO
	tkqdT60sfxUaFRFdocwoSQkZ+IEWu3sP2rIB1GMCJc4L1UoIZSc=
X-Received: by 2002:a17:90b:578b:b0:3b5:a3:4433 with SMTP id 98e67ed59e1d1-3b500a3463bmr9398644a91.34.1795803383604;
        Fri, 27 Nov 2026 10:16:23 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm39867121a91.13.2026.11.27.10.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:16:23 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: linux-ide@vger.kernel.org
Cc: dlemoal@kernel.org,
	cassel@kernel.org,
	vireshk@kernel.org,
	linusw@kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v4 1/4] ata: pata_arasan_cf: add missing newline to warning
Date: Fri, 27 Nov 2026 12:16:16 -0600
Message-ID: <20261127181619.183139-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127181619.183139-1-artem122novak@gmail.com>
References: <20261127181619.183139-1-artem122novak@gmail.com>
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

Terminate the clock-rate failure warning with a newline so that
subsequent kernel messages are properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/pata_arasan_cf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 5e02d227ddda..61977f0ed84c 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -318,7 +318,7 @@ static int cf_init(struct arasan_cf_dev *acdev)
 
 	ret = clk_set_rate(acdev->clk, 166000000);
 	if (ret) {
-		dev_warn(acdev->host->dev, "clock set rate failed");
+		dev_warn(acdev->host->dev, "clock set rate failed\n");
 		clk_disable_unprepare(acdev->clk);
 		return ret;
 	}
-- 
2.56.1

