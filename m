Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195800;
	b=CN7w3ciaQEnVgOai5hBNCXN4t3/aag/Hk4O6YRH5H8XnyvX2y3jbPAq0oMPJaTT9ccHK
	 5eQ+PJaf6Odv0EIFGnt2rF7GcSo38WnMai6hje+AjBLZ2y4GjujWAHropb8CorfI8ipOM
	 NrEzcNMHXru8DKMVRXNs3P0SV6CxvFlnCTR9DKEN0/cG9NvHbJKavm3qFhc32zgbHM6n1
	 VxH8FWpsfPUFFMbxyD39nDhNQsxxUXXFnHfhVSADRy0dqu0x6kwvSmnOHD6EzbY6fv+7c
	 4VOTr+/pdDgHDbGRoglCbkxmfUF/sMfd10qALt4Unx6GZjH+Aa0VJdH4YC6ILUhmEIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195800;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HT6eDbX+kfVSe10X1m7URXsOzCt0sFsz621mBMnptKM=;
	b=s4eyio/T3ZH1hop4vtxC5VjCnVfblsnx/cF3k/fTaMM0L9RsO1OUTZRHzAEe3d37oHG/
	 hSmlUrIa5ytrPthmdKEz7QwGjI1deGdVIVC864bV6p1X3D473pv2gRCqPJC6YaKNIV+vj
	 0C+UsLZbwFB+mnwpMS2BUk43ilhMEpNGqFoc1AAvxewQBnpBgrYSoiZNRSN5bD/zTNpv/
	 ZtC7+ZkVbVdSUiXDV9JEyUsqjKTukXTpFzlXWeuRiTnikNffZzDDzEgXTJWIk87xYOqXH
	 6UUG0FNICDRMftYalxM3DePAYFi8ayV2w7Vsm+vGttv8gnqKWfu01Al36kdsO8IGNfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xQsqFIgL;
	arc=none smtp.remote-ip=95.215.58.24
Received: from mta1.migadu.com (out-24.mta1.migadu.com [95.215.58.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1A60A2639
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE1A60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xQsqFIgL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ng2Ry2bda//spl0pXqaswz3X8TtF9snH5kUnqXCKZSI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795195796; v=1; x=1795800596;
 b=xQsqFIgLfWC9ep70ennh+xgFHEjIDoEudqB0LpE8938za97UTmLDdUBy35EwLgQptiAiaEbk
 XbrNy3T5s3B4a9V7OJCZtzRfZ6WCCJEIKpYq4suWi69FNRUtd3Gg8vjXI1yfuIclpOwv+0x/GOY
 F3mpqrg6vo8WzJwdMBpOuoF8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 078465ba8668cede;
	Fri, 20 Nov 2026 17:29:56 +0000
X-Mizu-Trace-ID: 078465ba8668cede
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
Subject: [PATCH 1/2] powerpc/64e: Pass entry point in r4 to book3e_start_thread()
Date: Fri, 20 Nov 2026 17:29:48 +0000
Message-ID: <20261120172949.3494131-2-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120172949.3494131-1-bradley.morgan@linux.dev>
References: <20261120172949.3494131-1-bradley.morgan@linux.dev>
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

In generic_secondary_smp_init(), when switching to the target
hardware thread on Book3E, the entry point for the secondary
thread was loaded into r5 instead of r4.

book3e_start_thread() expects the entry point in r4 and
immediately wipes r5 with MSR_KERNEL, which left r4 pointing
to booting_thread_hwid. This is bad because the started thread
jumps straight into data and traps on an invalid opcode,
hanging the core.

To fix this, load DOTSYM(fsl_secondary_thread_init) into r4
so the secondary thread starts at the real entry point.

Fixes: 2dc0bc1138ee ("powerpc/64e: Fix secondary thread bringup for ELFv2 kernels")
Cc: stable@vger.kernel.org # v6.6+
Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
---
 arch/powerpc/kernel/head_64.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index a54f6f9791731..0077ce148a5a6 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -374,7 +374,7 @@ _GLOBAL(generic_secondary_smp_init)
 	beq	20f
 
 	/* start the specified thread */
-	LOAD_REG_ADDR(r5, DOTSYM(fsl_secondary_thread_init))
+	LOAD_REG_ADDR(r4, DOTSYM(fsl_secondary_thread_init))
 	bl	book3e_start_thread
 
 	/* stop the current thread */
-- 
2.53.0

