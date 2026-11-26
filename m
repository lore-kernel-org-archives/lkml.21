Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735877;
	b=12sGehExhPdvwVpfHqg0FUKG1cXsg0ZEcp7d3MvWp3kMW2oTF5SoeMHjD8zJk7ra1n+K
	 5cjn+/8D9HQsyhB6xJT0YIiNPMJjdk4hbBnsBlfdu1cW2GB7TJb/TKX2VySulmWP5W6qJ
	 MNtYq3hLHkftP0+6hYSaxtaJfmo6AB9BxE7jkC74jvE9fnvt3lHVm9Pth8ZoitthTC9EX
	 18g4T6So72aP53dstrA4Lh0SRV0QApN8pbXrwJp0XThTqzUAADIzfthKdYhaklaaSS6rB
	 oTgTmy/YlKWhz5TZ4vbg6q8TXZ4a+ono6lLsNGs4pqKDmKGUsqLDaWhOI6KSdiSC4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bbz8LNU5azQdFUh5fnUImloX5/acT18ctarlFycpFR0=;
	b=zlUyOYnTpWwoNCjRmNV5y9TSGR7QM56ylsSwd/xnrkfwIt6ltf8DHcdUOrzXYUbkl7kg
	 3wbSG3GGs8hPjfP/UIir0YdHcdKkFu0d4hkFisb9bbBZQhChkqOkdVPxn8YLrVQqt2qNa
	 8dD+Gr/BFMY0R6nkJCmc4ljZqogK/nDY7tt75abqi2k5Z9NMJF0ooJY3a9GuW51+oZ4ww
	 ggqEvHBQ8bAcBDqfhztBaS+9kXJazj8rZxxP7rx8Wb5uM/nKnYsP+a5R5ak77+KfURMOi
	 8nO+zWNJlJ/TehrAZ7+DFqjuKEnYhX/d41knZlxAl+4Y4rFF/R9BzvT6I5gerAS7/gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYqsElL9;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6446606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6446606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYqsElL9
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02ee04378so58595555ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795735876; x=1796340676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bbz8LNU5azQdFUh5fnUImloX5/acT18ctarlFycpFR0=;
        b=VYqsElL91Y1RIoVBITEZc2NCwtYY4cORIJLr4fvdhuAPmR3OCRy44QBluwxS4avxbM
         yau/dTj2b0TGQxZupn+XMQItvGempjRr2ldXbZn6M0GCxQJETApAytKWVPqgsPBkuc4O
         5NRRr1q9l73bwcFduaqJ7GasNlmR5nh9bzlugPdfqpUpRVzMLAeKVpQEMeycDQTHbvQv
         m6FPm5ukw4GlDYjQBBHcSkzuHWlH4/z4rdGPaN1Tif7quCnS7kNk7rrp2dN5ppq86Rqz
         qBS80644K7k08abEdmgch/MAIi2y6ItnqbsZFULJcW9lhkIC4x+uFiJkEQxBsqanOfVt
         Gq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795735876; x=1796340676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bbz8LNU5azQdFUh5fnUImloX5/acT18ctarlFycpFR0=;
        b=Q+i182Adjboa2HBCKvZEiq/kdiNkup3ddby9wbkgSzDiVDVszbc+U1cmLawElD4Oyz
         RQWZGFuOA8iwum+eXCdcsKMqKoJrAUTtbzOs6GUIxamr2nqnp3iHAbfMcU5VgrdJQCtk
         ic7cZ47y16MORUVOk9u1XDXSzwKJNrKlINLNZc28WmSUu9MyZuy+ftZXIhpMTbo9ZX40
         w6cYVwZX73dtngNYtJGwhId1E2cfauw5xJCwWesfSmlRCk0uCSwJ6Fb1TX2poap69orO
         6CnomLUC7bdcQR1VkMK1I/dQuFkzRRkrXxBZFWDx9+bVBVy9sI9c0VvqJWBRehbYw6i0
         s7YQ==
X-Forwarded-Encrypted: i=1; AL+hErFIa0MgY3j45bgIiC1o4eS+CAglwuLJhyfOTQ+NTCL6wvO4oTO4rxu5+QYm6ftTgxme4cdi6E5CSF7hRbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aSiurmNGvbOaTr3riXyt7kwvBL9Qv3Z0VZN20WO20KX7a34vK
	eXn3HlNSVuhN2S3sPpfd+QUdBjNqcmkzi1KlixttUGq3NARjtShnzrfG
X-Gm-Gg: AZFdTZfRIbsqu98sJFRvHxwyGMtC53lzf1O3tqMW5luDZhB1NlZo1Ae1VYvHIl9h38e
	u0izMAshhNdD+5c0KsZ/GAKRwO42AfZFbML21C2qdmmdWEYCA+HYL8qwSHjKtm8aoLBwDQDr5Ym
	S10e8Vu2d/IH+4+2xawGJv0h783uH8cx+8xVmqayur8ttCdQbsxXsjuWQd2QLflm6uhsaUFV6LC
	WSAsJU3zONigUEKEgBfj9kFdwjhuYO3u8pmD9nBh/0HSIoBQSqvE9/8ZHuJ2bF74NxRMHbltZe9
	Gx/XWzRMfUsi1SAwmn1ku015WOPR/qo3lMx1ymqGfc4roeQdGYHtCn3c96gNE/N06n47wYr1v4F
	ymu8NRH4He8tc5YjghJH0M4lFl+VdQrnZvVftjZsJWd54KLjtAi/S+DtfH5GxIskzf8+mWbszoB
	tZtz+HbSkZZ3A9zlOlkzIDi7oQti/CAvYVUCKhSpDoeA/QSyGQakf7NCTHzqNuECV1pEzF4HWil
	/QI5SDNUfVxzmPUFPY/nKeoB7vAzB7w3yY2sFk72uhieF7v2qTtwePCrl8ygjQLFc4lueXlYQtt
	DbAMMSDvRo4pj3xaXhe4vfs7dhV0rYUN6tK8fV39SePFYywYqA==
X-Received: by 2002:a17:902:db11:b0:2ef:eb06:387 with SMTP id d9443c01a7336-2f03f246dc5mr238581485ad.47.1795735876217;
        Thu, 26 Nov 2026 15:31:16 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm108793055ad.17.2026.11.26.15.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:31:15 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] KVM: arm64: remove trailing whitespace in reset path
Date: Thu, 26 Nov 2026 17:31:12 -0600
Message-ID: <20261126233112.71504-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Replace the tab line in kvm/reset.c with an empty
line to keep the source formatting clean.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm64/kvm/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 10eb7249aa9e..6116c9ad054c 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -108,7 +108,7 @@ static int kvm_vcpu_finalize_sve(struct kvm_vcpu *vcpu)
 		kfree(buf);
 		return ret;
 	}
-	
+
 	vcpu->arch.sve_state = buf;
 	vcpu_set_flag(vcpu, VCPU_SVE_FINALIZED);
 	return 0;
-- 
2.56.1

