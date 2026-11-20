Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195797;
	b=F3RnhLKVlJ/wMS/QII7jQM6FaK6pvcI2Fnv/KgDmAkuO3jkWwsfzIeZq9FrOgPU9yQsF
	 kS7Zzi7TtZUJTxAToX4LgbrEwvxCqK45rvA3xPa9HvaJIAHH2hoccPAcPZWIjVCBia+mM
	 FSISbQM8dwEAJBtRb35XEdVSif0ZQI7Q40UfwbZjbGU0S9Tlglt2tU4ZyjhxxTk77LHVq
	 xt6XYu5aXNK5t0sHottFUqhivrY3fejaueU8EBOoiVxAjQnA3qo2AK/Wg5RK1Wn0l0PcC
	 VQaDf/1upCgWrJK+nXDmG4rI57cXWsiBREXX4UvyyWb5FnHxWspD0VffpSID440fOig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195797;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oW/PveCuQ5JM7ohOUMNi3qcUSCoWuYEn+oLybhF/xoA=;
	b=OqR4Wyl+/qHU0OFzmqcNsFBJtf03EZSIdYCj65FxTD9dyFaibNRffjukjqu4NVQ4iuOS
	 82mSyJ/M0Qk68RCDUVl6hVf3J2kJ+0JK9WilzBbKMIY9PJHEUg0B4LwWWZfz0WcM0y1Ha
	 GnmZLabCP1lUXi7t/Nw2pFbjPyTsXywXeikgB230LJx3pc8g8J+rX5pLpkKtXdcXeazZM
	 q91hjvLsxrm+vxL4AiLas37YAwe0YakyPoZ2B4K0gu3vJ3E+gHJd7KA6Ikkyl6Un1v0BB
	 /EDeeqF5ZMnhXIN9iOUXV+43RCarlX/J+81Nix8qytEfxL3CB4K11WVNYNVe5r0POlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P2VH1nKb;
	arc=none smtp.remote-ip=95.215.58.17
Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216AC60A263A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216AC60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P2VH1nKb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/HPVnKLrKCABmIOGSs3z7lVqaFWbyhWILXjO2++VUa4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795195794; v=1; x=1795800594;
 b=P2VH1nKbPXZ4cCZlLKLKMlD/hOQ1muEvODtFi/+MYProSSpmsq7h4M09WnK00LWZrNHGOj7d
 xeywB6wEsBRCnjvtqF22KUJ5mE+vgGEazTTNbq2vzngkqU4UqZSK/DE7CIv3/YEzkqDkHBfLrrQ
 9a82xBZ8CcFponccvpQznN58=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8733609d355f8002;
	Fri, 20 Nov 2026 17:29:54 +0000
X-Mizu-Trace-ID: 8733609d355f8002
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bradley Morgan <bradley.morgan@linux.dev>
Subject: [PATCH 0/2] powerpc/64: Fix some snafus in head_64.S
Date: Fri, 20 Nov 2026 17:29:47 +0000
Message-ID: <20261120172949.3494131-1-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
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

While reading through head_64.S, I noticed two bugs in early
secondary processor startup.

The first patch fixes a register mismatch on Book3E where the
secondary thread entry point was loaded into r5 instead of r4
when thread switching is required, which jumps to data and
traps immediately.

The second patch fixes non SMP kernels where secondary processors
jump to kexec_wait without copying their physical CPU ID into r3,
leaving the next kernel with garbage during kexec.

Tested on ppc64.

Bradley Morgan (2):
  powerpc/64e: Pass entry point in r4 to book3e_start_thread()
  powerpc/64: Set r3 to physical CPU ID before kexec_wait on !SMP

 arch/powerpc/kernel/head_64.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.53.0

