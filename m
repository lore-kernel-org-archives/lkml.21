Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428452;
	b=RUrfH5SXiYhwMSxh5mPCDasDzujgP1q3k98z6UpDXwBDq3ar1tyWGZOW/kIzADOvgUXK
	 ibeFZ4ffm5xgbnSFF7j2l5M9hxmdklnYltW3DA3LtzZ8oCXm0Chzt5L5jEXTD/EewM7p1
	 t167Wr5wOL4M6yRYi4Rz0RvFTT9iHVmllmk6KA9FnmtqWdk7Sji9kMjicoqBZXwRC9nRb
	 064kID1IMHn/OmDi2pfu42gAY4okMdSeyvnpsTYHQAVJTkmMZIFqpoHV34VGEAz2pjvqo
	 ahYwkhCERracUrZggB56N4BdL/7NDOzxuzqsD+7KLYTflEBi3KZES49SDSioOJISMQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YNXr1cJRDxjFRtGHo1Yw8wGLJl2y+mtXfW9P9FUgeCE=;
	b=Xr2zNwYTbWl1ESvcljMIZ6VJFNt1PX3COPrFdg6Ulx06rhiOdvmWQxBbL9ZDE+4iMIHD
	 70iYpCS4nnjzEhUptEfYbcWHhDPINcTnUyguDiLMyvinOQYbuQRjUz18DJqoaAf+py/D0
	 iaP2POVc0Z9PyD/7aCQ0asDhuf+MgKWiiEWZ1KMESTTmA/FUAnx2DYz6dp2JzypWQDdwy
	 0hBD3GkqD51Y/Zi5rQeuAZxExDaEW8ybLgkXUumk6g0Z0BE1L1ckGa6F6BDS3FJgR6mi/
	 7LUDplgziE7M2X45ioM2xTSrorkf+mjjYkuhNzHCHrnIANQOKgaoh+2j+hT0jwPH+Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQUCWc3K;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F34C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQUCWc3K
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so4243145c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428451; x=1796033251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNXr1cJRDxjFRtGHo1Yw8wGLJl2y+mtXfW9P9FUgeCE=;
        b=GQUCWc3KywEfq1ONwfcZkeWJcU6L2Hx2PycLnXFhTrAeH6Gzevp/76LTW3tRD5S3LA
         gZ3EnzYY6pdymFYyV29/mxm1mQ+FG6/8eD6U7vJoweA0WiWqcaJJxwLfJxKNuYJfXsER
         kDUOv+IueG+/i0RSJTa8Y7Z5ODBug5CUz5nDFLtxLgq9FrPYbjLGqQFHs6P3WUgT5TMp
         6TNe4u/BIY+fGHQA7l3/u8hH04fyF3zlrFy/zFHdDf3xEjnIlbk/hEIkQFGZ09jfbO8c
         cO354H9nlXR0hgd/aYx3VTBAWKnzfxIdKDZP3jiyRbp3+JFutEQ6WbcVfclnIZ/rv5GN
         9jEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428451; x=1796033251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNXr1cJRDxjFRtGHo1Yw8wGLJl2y+mtXfW9P9FUgeCE=;
        b=q96Xn9+zJ9QwGUpmX7ZHw9cutRnlZOKqRtjfFx1SY7g3sKlvDkwy88ZvfrKNiOS3DP
         goDFjPCaeQPXILaaMp94RRbcceF6Giv11i3LSPUYKZ6SzAnkNEUwTX5/S7zkAIlCJHVS
         pXNQrm3l/qDJHJuMWKdjssbxrEcPCWmb+Lz56tIU5sZA5xz30510m7tiVyP782P5C1IB
         wJV1eP7XL4iz+UOAdTHki0A8od0QD+eLnxYsa0c+CwN0hNMsViRtaXnlEy+IG/Z/XXq6
         qNP7qFzQCRb56B9o6d5c1rZaEpTRKoG1i1Cx2edZ+4oDBQtWFpMdgBqK6qe7BF9lmrSx
         4wiw==
X-Forwarded-Encrypted: i=1; AL+hErEhzsC4SBe5cZJF5/9mNSUSCHCFIfU7jqL+H+CwezwiRuChwl32Rp+zTFWHh+adZ0mWXtSgw34/vcsI9xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HXzKhu0T5Y8wzqo1jauqSofHF0U3AnjXaFuSyL0d3jdDw74Ks
	XWyNUEdQlTNIzcMYNdUkDU1EdNQilrHQwXkrJyc9OY7RX6fdSCngUYW3
X-Gm-Gg: AZFdTZcqrwFCp+hiTm2mrjIck6TBB/SZVcy+GgxoKZ4OpZv0luFtGA5pmjAnG3JQuT8
	UYr1GUY5kF7qCQNaWhHngGTX2N0noAOK/ke0bHoQG4hB2Q5VStuAqZ5tcWnptAyMXuZnuFSjhjU
	JTbvFDxs2n8uFR8tzflMiOrSjLXca6GEAlJmqUWYS0v8qx1erxt+j7OyYa8PjGZ2+T2iftr4UIF
	9N56bxXVMUeTM9Df0eKSwS+1kZJcOPzbDswJC1Tx5GPiidO5WUNy9n7jzNoGDL9O/RIlKiFSNQ5
	kArRQ0aTI7OzGPellDzWwqUn9ADeTp2rcTx7UHZGKx613ltNFD2kSkobz/lKgO2Dy53KAfsphNd
	yrf+1ZXhySkNYGnYLBV2DuGfvuLnpJqOHmsfPAOIs+mEpSGAY+H54/X5Q2Bu6De6ujMVD4Y1zVq
	7LsN1zgKezmBgeuTxuw8xYSIkYv8eyUgihiKH0X3VagjzmxupI8VYtiA8RzfR+agS65bX230BX5
	0YVBexnaxrW0RG1iUNlUX1dR2vGuSboMYHRrFo3CgaXKc2oUXX98QEHbpRYgsdUb3jKT+QSJJPV
	p5DuC2F2JvWOafBYQIWBXEq919Hp+3agkml8jlwt6A==
X-Received: by 2002:a05:7022:ea8d:b0:1ae:59d6:91d7 with SMTP id a92af1059eb24-1b5568eebafmr10409997c88.40.1795428450986;
        Mon, 23 Nov 2026 02:07:30 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm37650054eec.21.2026.11.23.02.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:30 -0800 (PST)
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
Subject: [PATCH 1/2] MAINTAINERS: Add the LoongArch KVM selftests directory
Date: Mon, 23 Nov 2026 15:37:00 +0530
Message-ID: <20261123100701.1679376-2-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123100701.1679376-1-gokul02k@gmail.com>
References: <20261123100701.1679376-1-gokul02k@gmail.com>
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

The KVM/LoongArch entry covers tools/testing/selftests/kvm/*/loongarch/
and lib/loongarch/, but not tools/testing/selftests/kvm/loongarch/,
where the tests themselves live. The */loongarch/ pattern needs a
directory between kvm/ and loongarch/, so it does not match it.

As a result get_maintainer.pl omits the LoongArch KVM maintainers and
loongarch@lists.linux.dev for patches to those tests. arm64, riscv, s390
and x86 each list both forms.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..fed2245b979f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14327,6 +14327,7 @@ F:	arch/loongarch/include/uapi/asm/kvm*
 F:	arch/loongarch/kvm/
 F:	tools/testing/selftests/kvm/*/loongarch/
 F:	tools/testing/selftests/kvm/lib/loongarch/
+F:	tools/testing/selftests/kvm/loongarch/
 
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
 M:	Huacai Chen <chenhuacai@kernel.org>
-- 
2.54.0


