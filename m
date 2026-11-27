Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764575;
	b=zRPflSjUTPybJhBWlwxjVx6bjt6f6vCfnPTLPDgC0wwzFNGI4I19ZggaTQ6eByCvcoHK
	 GMVWlIxWElxt8kz2LBWgEAZpvUlcG9usQa7O7IuUmTcynklIHF5ItG0DV4dRHVNGKSVb1
	 pARQNgOadPjv5FGluPMBft8Keo6ET/DgbmgGWihYqaAH+bjomHamq0rYaEGUFh+dRicJu
	 gzJr5Sa/ZFILtdmNKBUJAyRRMXCBJXtx4cfecuyr95rsxq4yP5K5JpLEvxVWibnd4FCge
	 takye4CxFoHUJza9Hwb3kvJPtSJzyztLulhnhqoqCnBR9gZNhsPM6R825p3lOdLYqVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zBDrPtxr95uLq+wwut/I4OrBKrfga94bFFGLEETXFFA=;
	b=5hhnt3IA+Iio/tkexNVo/oxl51CviZH5u+oXolkD0jC3aHHFJqPkLCaq/fdb03dD3d7I
	 9imvxpN5KWJvF4ttKur3mgJAU/3ekcWuaBqSwIpnX9ak0IP0sY/3w+7GYBDZd9Tl5GvW/
	 BXqi7jiO5EL+OAFO9s6u/0iWQVCcidrerwRQnQiQ6PUJNJRbeECvvED+xQv3t8vaUHg0+
	 ofuL5CsVwL3qO6UnlevOK/jBH/AGorjuuU8hH1B8HkkmiMih43aZTwXGXOzhnWWnY+3DS
	 cW+1opkTSMUxyMWUY1RMpayNJH2jjOMyJot3dTKFN58SPtt9JevGrLvM/kxi/doe7zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJPXlrX8;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069F606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E069F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJPXlrX8
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386c336eab8so4221344eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795764574; x=1796369374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBDrPtxr95uLq+wwut/I4OrBKrfga94bFFGLEETXFFA=;
        b=lJPXlrX8owYo6OLbUTNBkyNo5jNAAPWr5aS/HRbzwEah5/mBpk2X4Dh98goKV5/GTf
         2gt1Ai6oEydB0nMvJQ6QXSz+QYwi3xJRaIQpwvY5q1Cg98OYjmwVEq3DFTdc5uq65zdW
         +116mw94N9AXqHutGfGLOUryAJt3M8Shns6h4qPmPz/edRhjrw9FV2CE4e7zGcTyUvRT
         c8IJshIvHKil6JlIfvWfQ1qpYr6/aQZCTI7cap4HNFbPKROia/4nwKVvhf7/qdwOd6A+
         qqXjxyIfqvrISjENqmrTL9tSW8ajLn7HXvT2BFlY2a6tfduAzgYU47zA/A2gni0RAX7l
         jvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764574; x=1796369374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBDrPtxr95uLq+wwut/I4OrBKrfga94bFFGLEETXFFA=;
        b=xafjmPayhd3oul7TbILJf8xOxLqDtY7MTzDVGLWYxNjM2f8iC0eUVpPcBpyxAy1zN6
         daolnEIHqDN7ReBNidA73ivl2Z/z+XsEoDTZ0Lsocw4WWrUlPqN1K8/FArujvscroPXz
         5LLpv46PMuG+IqmXAiR6uuNFCehloripCysNu+c4pKHJan5Tecapfxe/qGz1Y+rzHeJB
         NHlbn78MLRfut6hI4caBpH4LkKTKH+Xi6S5aNNq73GVMK5tnMrwknwnTpgkNkVDvS7Nv
         jASeNzD1w719hZBt8ady5O5YNLHrT6aV/sypv1hQNEqAK0PiZA0qYMd2TlOWLn+yvpJ5
         VDZA==
X-Forwarded-Encrypted: i=1; AL+hErHTg2D+6khVR1QRfsUc+qvnhEeV/5oVg2qzjOta6gH+MfSGovqSKsCtRJvRPaRnyudZa/RHpiZtf3vWJ3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tSpjry0ERHWD6WXcjBgBicb39bbRWCtUKQPIhMyOtzl3RZ7w4
	gF28BK/HMAHqMdDBWDIRdwX9P+xiUa7q9QM0HwBcz7kR2nZJfKF4vFy2
X-Gm-Gg: AZFdTZdEUF8v9ksS4lCvU0QdJMkmApJpnJN1jOgpAdUoj0ZbWDzLW2M0ggDYxbWItFy
	Bf8QIiSoHItuTIuyG7wDoYKEHp/Rs+TdIz0MfrxcvirmCpVKlpzQV+R9etHvW3XPzBTTQxV8SH6
	3ti0zXtUWnO/fosT2w6WNHdHXrqelZ/RauyY3UDNEdWZuismZCevl8kwCvtwRJvmRoXPM48T+sR
	uVr+5eiMJ4NgAUwQF2uIR9q7BQiJOU3JpZ7XHUITx1QRJ2x67HFp6Z5O/u6tYxl+BPMnKoeYfD8
	WMTaMDnmwskUAEhpzMFCXprFNqS1ZN7xiXWoEPrPFqbWSaKbBRU5gcVrwiykNpcA6NPQXxd30wW
	inGWi7ZkdoX+gcTVI2BiW0At79DgobMiJ3ZsBoU3yFKyHw2sY82GhJnIrIu1RJxHhfqjhAtyS1z
	BJBDL2wuxKjCQRVJbjise+JX/SaSmGAiBsFduxXUYaZgcOb4DXL6YtNjqq+cDcymtNaSUzywmTq
	SwViQIceLsGoxbLN7iu5B7+YW1RiJAt8iF22yFdBn72iCOpMm6TTa0mS84SBuy3F2O2fy752qbe
	4XrEXr992DM+AuWmDgMlotFOoZJMhD9cFhuEKDcf+DnF9bs1
X-Received: by 2002:a05:7022:f90b:b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b56f36d5fbmr14790665c88.2.1795764573739;
        Thu, 26 Nov 2026 23:29:33 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm54799871c88.8.2026.11.26.23.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:29:33 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ima: free the rule label list in ima_free_rule()
Date: Fri, 27 Nov 2026 14:29:27 +0700
Message-Id: <20261127072927.172066-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

ima_parse_rule() allocates entry->label as an option list, like
entry->keyrings, but ima_free_rule() only frees entry->keyrings. The label
list is leaked when a rule is freed, for example when a policy write
containing "label=" is rejected.

Free entry->label next to the keyrings list.

Fixes: 47d76a484050 ("IMA: limit critical data measurement based on a label")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 security/integrity/ima/ima_policy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 2dc1d93aa768..c3c4faa99f5f 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -410,6 +410,7 @@ static void ima_free_rule(struct ima_rule_entry *entry)
 	kfree(entry->fsname);
 	kfree(entry->fs_subtype);
 	ima_free_rule_opt_list(entry->keyrings);
+	ima_free_rule_opt_list(entry->label);
 	ima_lsm_free_rule(entry);
 	kfree(entry);
 }
-- 
2.25.1

