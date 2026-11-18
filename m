Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991945;
	b=qGfWVX0YIY73xLMOFp+qfEvxksO0r9ionTwb08NDbpuj6zFr9kvoTXJnvN5Cvv5J9+Ec
	 eZdlg62IltLWvuMnfqYmyqLsl2LCSbOeC7dlfmvOm/jaat31IeyWj40D4AOz+p+0bjdTS
	 YBKRgtOyRz7hmXjLTps4W6FbRNczzPrkLtzA/mpqsOd97BxheJSj6ixCV/kS1VY2tkiXr
	 YFWMJmkkE6IZoSjTU40Lx0yUDQj7scIOeOsX1i8uj8fsETauGgQnjZGz1ZwgFFsJRI8jp
	 0u+A9bGP1syMt1MN4cXPpfMMr6963CTPeiB7LQwSjbcO+yZhZnJPq1TureYRCljMlmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eZUgNvRThSBkygn279XE/ZK5ImQQ93aCcXD2XI/JzgA=;
	b=jjS0BiaNWyWH7mr4JFi/HjCPl+tQOhXJHjneXgpigeWEGbP3PZ5gqX9+/BeJp3kJUzix
	 NC4U2shmCM7WMgmJcMkeA/o/IFf1YfsPF3GdmDSThZZVzaf0xPUAvz8PF8KmdX8Yn48IN
	 WhBDdbhPeXqMEq9Pd0doX1K3loHpkES+4MkXip7EY7Xkb/h/o2t52a8gCNR78t3h2HsFT
	 r2CSDfq0MRCGHQO8pBZygWxViQCDdnK3NjDxbAD/+EEvXi3T2tvX4Q1yz+/m9MmnH2/QM
	 8/biRRMsdsm8WziFDejFn5HFxtu56BfRozVg1UsgsxCCLD+2MFvAcT7WwsnaAsAnqHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=He9IaW+M;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0C8606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D0C8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=He9IaW+M
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso77401166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991944; x=1795596744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZUgNvRThSBkygn279XE/ZK5ImQQ93aCcXD2XI/JzgA=;
        b=He9IaW+MibL+q/d8FrlanbAiok3rByNCBQVzaihfOKod1yX1q4GUBOpKmwNRIjJRTM
         xqw5ELx4J5BDIT8DeIxu3RHEGEGJC63ipJhyPv/BzEoPVCh0QOuRZe/r/Bzl8+bX7Eur
         ADFWO9IcXU7ozunE7frmOJ3oDWqZ+QnpNulWT1D0Z8ecl+R0TGpmeGjAf/HxzO90hMNy
         7vjvXlvQNnfF0MBEgvKhcK8TkWp64l2yAtI4/Iw2du8kGWem0txt6naabgdMrs/4ELFG
         HRqgTfO2yEPA7FmVaB+VoM658abNZfYRGLmC+AV2bJO/5u0CdRsBwEPuNtbAu7miiFeT
         LTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991944; x=1795596744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZUgNvRThSBkygn279XE/ZK5ImQQ93aCcXD2XI/JzgA=;
        b=FCRL9ZiKNhYucdPuJosf95Fy/27H2xtRvUWlHxFqe1mWu+ZYVU+c+L7ZzvQuHauR5V
         9oAyyzT4MZ4ofc3X0aoFjGW+y/7mHEOWqeM9MplHBu5RFJw7ROAUz3JNmtDIaa1TRuEK
         d5WxWp/1QFFuQo0SlbpvHlpJMXjxlJD0iMZSGHTVqbzLFovBbFfo/uz1YZFyaeEYzZS6
         J5XSzeU2C6N04ireUYdXbsc6s9tfYnLTZCtzX8EsKBPktFtUBiR1qE9ykYx9rrchGoF2
         0R4LLR+VrQRcbN8u6AahXzlz3+syvDOa9FhUDPd9Fm4W3jAMerMhQOCwtxyQvn8CQrvH
         GkkQ==
X-Forwarded-Encrypted: i=1; AL+hErGR2cNKfsIjNM5C9XcJCp5WU2gFll4bXmqARCt44d9SNoOjWnkA6F3AfnGi0P3sUPxn7Lzvcj0YP2J9cSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z++rBQmgytRSVSu5tQJKUWtWgVzGIisSUIvX2pwWyxX9EHLL3p6
	cla7z830h9cnGWLIwgQH3c+PB+RQkPqEKSPlT85LuQQOvdgw7LENmsc9
X-Gm-Gg: AYBFou3y9nTV9C82NY6JfmxP4+zJ2bD+WLyDF377oaJZvpD4rTDNV2CL/tQahpxAL0e
	FIeIXxziBXsgymuRTusQvS6x7bkg0K/SYv/KzlVmoL6XJza33Fvl5ILZ9rxsdYoib8PXaXbgRgn
	c3+Bv+jCQonN4Rs0L4I7MSUtjh5456aZmfS+fk4hu4Eu9/fwaDW3tI7fvQe2uXDGS/wVpdVkMYB
	QEYx/vHg3ETWrok8BMFaOkUV7nwoodji7OJ+rw6ABlM/JanMolzdF22FEwI8onkHKfmzbwH5gbj
	blTjY9aJHrJAiDubN6eQdjmVwEXVzgvwMAWLqTyYPoyo8zvwHu+4wUv6idNqz6sDp4HzAOLZyp6
	fyHh9xyP4vSSQ0/lJ5UYBLtSOTipIc3AjM8nNwpdeqrrcF2HGGFWKdj9DckR58SU5EbRJrMtrjK
	8pIrk9n8n8nWPMVXw3vzI4EjepLSbHaAR7oXrDnvIM/B3svRSCa1eNohC9PAsT1+CKs/cszI+Oj
	8LIX+kAtj7gTeeXVvYvFejJKOc3u6AloiIDdzncNkITQElDKqeOxQwq8T0ShmTWpkc2XJjLfTnX
	iLrwzLgE56TdkYVXXFyJJJZYM5eJPoYn45OZ
X-Received: by 2002:a17:907:2d9f:b0:c4d:5820:325e with SMTP id a640c23a62f3a-c510e159e89mr150966266b.13.1794991943191;
        Wed, 18 Nov 2026 00:52:23 -0800 (PST)
Received: from kernel.. ([191.40.25.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f31csm71077266b.10.2026.11.18.00.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:52:22 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 2/7] rcutorture: Require debug_objects flag for debug-objects test
Date: Wed, 18 Nov 2026 16:51:42 +0800
Message-ID: <20261118085147.1668598-3-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118085147.1668598-1-kunwu.chan@gmail.com>
References: <20261118085147.1668598-1-kunwu.chan@gmail.com>
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

rcu_test_debug_objects() checks for missing callback and barrier
operations only when ->debug_objects is set.  With the flag clear,
execution falls through to the test even if those operations are
missing.

With CONFIG_DEBUG_OBJECTS_RCU_HEAD=y and rcutorture.object_debug=1,
the trivial flavor can therefore call a NULL function pointer.

Skip the test for flavors that do not set ->debug_objects.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/rcutorture.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 968343be4e0d1..caa550095705a 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -4603,8 +4603,13 @@ static void rcu_test_debug_objects(void)
 		return;
 	}
 
-	if (WARN_ON_ONCE(cur_ops->debug_objects &&
-			(!cur_ops->call || !cur_ops->cb_barrier)))
+	if (!cur_ops->debug_objects) {
+		pr_alert("%s: %s does not support debug-object testing\n",
+			 KBUILD_MODNAME, cur_ops->name);
+		return;
+	}
+
+	if (WARN_ON_ONCE(!cur_ops->call || !cur_ops->cb_barrier))
 		return;
 
 	struct rcu_head *rhp = kmalloc_obj(*rhp);
-- 
2.43.0

