Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669488;
	b=LWoTuoDnazmmoM/JdG6spxrqqtGYtiB/fJuRKOiwlDzmK47Su0x9qG2DgHA/olQgSsOq
	 KyL79ibA7ze7AW7xBuXF7Kj6Tkrzcz3k8fklfki6rrTEBJF1EZau0j3RgTzJLiT14IO9P
	 48wBNRguohVK+kCwGHIr0xLPXdD+ni6md9iGjFlda2WEYd4w6f6H46NOIo6b25U7h23IA
	 8YBOOzh+XjVIrJ6OZS/2hJPKUnDMricly+Yf4sv/frC47v116QLiti+tj/Rabe7+Am/p3
	 01wGd65sLUzqS+GZhlrn8ITH/EOe4sCqDx1+eruGZDMBbfG0tNwMaNK8gXbaAZOcC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
	b=rW4UCQRCaaE7jIXoEMGwtufDvG1AWQuCl893ppGSaEKXP+plZUElSRKqffa+doryrut5
	 4829oZlHc1MEx3OLRgUM9PL8y/IHMbZ/aLq1rxf0UjRukDqqGVTFeq7mVywu/vVxsPjn/
	 nPa1KYPpXMFBr+w5JCsQf5IrM4WbDWNjNn+kcVoXjZZj+n/3Bf6bT4Gev73vd9Lwcir44
	 b9dcOYD2NMKXxDvYfFkfskgo6HTbKKWGBeoAqMqps8nxEjgaBNNzLzuPhhH5CBMmNMiOG
	 kU1vLfprJP3HXY1KLWDyzQVEMQOoSpA/eMAC+RKBIKFmFtoTOdQEMgTepcY4rVZPABw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4TuT61Q;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A5606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 213A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4TuT61Q
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386bd881d39so6154098eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669487; x=1796274287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=x4TuT61QEHzqtYh0juAuI4XvTMOyWJhGDXnal7jHIqLPCRaKduCYPALjsc7k4AGTDj
         +bBtaKbjdNLKt9pjOrWAE33W1zBx+1Io1nWiG4CR41OPvrMc3O15WtVPgu0kz+rbGH1Y
         IiguUrO2Mzm7UYQOZnsgL1A6PhM4pw4nWZs4O9m+fv7I71r+4P07VCCDUfQsQQl/LQJ9
         M601R4WfPJQmO2x5klfU4R+KNE2NHteRXVtFOi0fsEqK6mJ0II/d4NYC6xPrys1YYJS5
         VaPaMxlcxCfw3M62wFEk18593CSxtbjtSNHXIKSuyT4qWqDe5GVYcQf5C8Tp2JjcXKry
         MTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669487; x=1796274287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=I/RdtTInaJeVJnZcECrXV8y+tVLbj7TZ7nG9oKQGGxNcNLTEubHnHZTawhhKH0LFR8
         vOAask3XtlJ8eJELR+Tq2AdrdIeH2ZrBr4QIGxtLqaHcSSmF3xbpCAm4sYRIiqTvaJP5
         nxYTlHpYuYTPOo1O7duaVaTmjPyz1Ypu2TAWx9UbC95VvkoqgzgC1Bf8rGCRRcrpT33z
         W1fhlcu4EBlUeFQD0ZjLKgY+LzKfp/Omxj3IyOaaAaflY4qiYH/mgF4C21jtxNm3qVTZ
         hdNMWdzF8NobjHOHtncj2zKxt/hkZNU8gypUCegJKcD4pwBE8S7ENDr8YpB/uqhpP/9r
         lrrg==
X-Forwarded-Encrypted: i=1; AL+hErHtfq10EQJgivijAjZc8coELNHeFRtfWzujzTexEPNr5gb5wh611TjLP/SigVwC/2uekqFO67xb/83R2IA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pY6lTOb3LGhjIxTCXVI8AiPum3ZBRhsFx5Ynh3fqHlA0J2zoB
	ndYXZ6E0hWrZilSPHpXyxb3Oy8Zf9xtD5sUONgBL5Lns30NK342lpo6m
X-Gm-Gg: AZFdTZd770sz67ErUKG4D+fVJOMDuE/k/mFmojHtqiS74maW+kUtJ/xsTP+Nsar/OaP
	YiW2KIvoICkG3+QsPftnsNF7S1fsGY7F8UWESBXxr8w0/z7VY4p5eoC4vr1J+PFHYKDAG+itScf
	IfK6Bswlg6cb9oh4GFCs1bzY/2qfEdab+32opl+Qj4lCcb8ubttrZOHusrlJotUayVAMw2F0BZe
	3z+9Z1I3kyebN4anLlYtneVSrNCH7/FbG0T78snO3vCfGVwYfWcGph5ISzow8ZQyS+mpN/VadjH
	I3ByIb6/ipnWpTyWlVSuBkXVRhhZv2AIF8EnIY7DfDN0McXkQoCos5yUx7xT9LRIPDCPYQEGumb
	wjyFiKxWtPvdscvvqrmtpJ5N4KzxbAFHrqSIA3UR+qkA9uXJfZe5WNgrS51JI5JGPfl6s2QrH+S
	+IP/xDR99iN+CARhFF8ffgvpQWVY5Cg41G/b8POgxJ4WEcm26lnHRos3mP529UF/hpAJQuf6axB
	VuVHMRHP6/X57t70JerFAgMPQstqKkjxVafVXrygIDs6OpNZjV/LWWsiTIR8b+2ZZCaWAr+Uc9l
	FK2A4J/qTSs2+uffkRcCp8LTTuRBbDnQE0+ZIQT6BA==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr22517783eec.32.1795669487141;
        Wed, 25 Nov 2026 21:04:47 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm17154865eec.17.2026.11.25.21.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:04:46 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] KVM: LoongArch: selftests: Free the VM when the PMU test skips
Date: Thu, 26 Nov 2026 10:33:52 +0530
Message-ID: <20261126050352.1957454-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126050352.1957454-1-gokul02k@gmail.com>
References: <20261126050352.1957454-1-gokul02k@gmail.com>
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

main() creates the VM before asking whether it has the PMU feature, and
when it does not, returns KSFT_SKIP directly. That skips the done: label
through which every other exit frees the VM. Set ret and jump there
instead.

Fixes: 11c840192768 ("KVM: LoongArch: selftests: Add basic PMU event counting test")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/loongarch/pmu_test.c b/tools/testing/selftests/kvm/loongarch/pmu_test.c
index ec3fefb9ea97..c9dd3cf5de06 100644
--- a/tools/testing/selftests/kvm/loongarch/pmu_test.c
+++ b/tools/testing/selftests/kvm/loongarch/pmu_test.c
@@ -176,7 +176,8 @@ int main(int argc, char *argv[])
 		pr_info("PMU is enabled in VM\n");
 	} else {
 		print_skip("PMU not enabled by VM config\n");
-		return KSFT_SKIP;
+		ret = KSFT_SKIP;
+		goto done;
 	}
 
 	while (1) {
-- 
2.54.0


