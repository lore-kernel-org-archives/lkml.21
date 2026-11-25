Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630824;
	b=Rf12XQxmsilzoEfNvjQNTKxhNM1oMkmYiy98ky3PEvAmShxX4r1gTMoWMPEBuup5OF52
	 CXTGiNMcUsElODPWmurs4tZUBS7wPon563DPEIRfRWZyE0KoUZ26vUaAsQ94iHH/bRrul
	 J5paGfu9vTCvZzkzEy9kBqQpCe7o9ZpWKsJ+tEHMqmnB3BvfopefHiWZqmDvzBLsb+DH+
	 wJDKZ+OtQkTIj+dTf86z5uPBC19KXQ4yoiCade2tAljKP8LKHlsYUm6txQcv/kTtY7mZj
	 HY9yVfKG3+VJLg1xLyYh3TzAttO7WwNb1CPFAAMLzPaKG9aipOvgKESApwuGWf+ZNkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630824;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=BObnfMahGVcWak3SBR30KELL9gKjExrcR+q1nb84qH8=;
	b=g/pP06gxAl9pgX2HLkBmRRynXuraqRdoo62rk7SEnnQurHFUvWDRpnAqjUGU2N42sDsu
	 VZ18spBvDTuZFpDfudtkHIuJlLsjELrDqy+Bd2FbCRQdBc86OdO5+wgLKXslBc9w86k3D
	 aIY9fbq9IFrh6mgUPwLrwM3nif84err5IALz7VkvFUlXuHYqr6fi0VElyksFHAhTVH8pp
	 ysnCXnnhCuF5ij4SiUnpuWEt8gEuA1Y4W3ZyZX89601IQd6vItN2YG4iXImAUpZNcuZH+
	 lJhKaYEoFNqy2mP0WpZdsZ52YbkLinvmD+DD35qqlF8zAKRJ1XjXiv8kj5Wsc1NbGSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfW8EmZr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E153606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfW8EmZr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DD01F000CA;
	Wed, 25 Nov 2026 18:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630824;
	bh=BObnfMahGVcWak3SBR30KELL9gKjExrcR+q1nb84qH8=;
	h=Date:From:To:Cc:Subject:References;
	b=MfW8EmZr1ITTj1w2HCtI2OwdZzTHKTtCiEMR2kGo18e4LMVQLxgayJmHPtfYit0yJ
	 hD+/7FqaJdI661WsJ1wAqdUiBhG3CITDKu57Owe6ktO0HK6NyL1SoEbKzX15dokoKG
	 qIrG4TQLHNMWwB/je7bRrlE0i8j6uV+UtnrSKqecKegQ3mU8PhgJYht3PjC7v84HnZ
	 32n9nIou8T53iaE3AE+Y3xaiSudNWVYfDtrf9qb49nMJJL+csLf8BmMKJGezjmv6Ba
	 qdjMw3btYrjWB16biK7adyhCb+CEK1V08lBm+OBne5XQy38XgcovlAglBs9KYL7PXb
	 jpzIRclZZXi/w==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWHbT-00000007E6g-0bOz;
	Wed, 25 Nov 2026 13:20:23 -0500
Message-ID: <20261125182022.946937059@kernel.org>
User-Agent: quilt/0.69
Date: Wed, 25 Nov 2026 13:19:53 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 pengdonglin <pengdonglin@xiaomi.com>
Subject: [for-next][PATCH 1/2] fgraph: Format error pointers as signed errno values
References: <20261125181952.861853319@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: pengdonglin <pengdonglin@xiaomi.com>

The BTF-aware funcgraph-retval formatter currently treats all pointer
returns as hexadecimal values. Error pointers returned with ERR_PTR()
therefore appear as high unsigned addresses in smart mode, obscuring the
underlying errno.

Recognize error-pointer values for pointer return types in
btf_trim_retval() and select signed decimal formatting.

Before:
  trim_retval_ptr_error(); /* ret=0xffffffffffffffea */

After:
  trim_retval_ptr_error(); /* ret=-22 */

Users who need to inspect the raw encoded value can enable
funcgraph-retval-hex, which produces:

  trim_retval_ptr_error(); /* ret=0xffffffffffffffea */

Link: https://patch.msgid.link/20261020104710.2366146-1-dolinux.peng@gmail.com
Signed-off-by: pengdonglin <pengdonglin@xiaomi.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_btf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/trace_btf.c b/kernel/trace/trace_btf.c
index f0e0c04d58d9..301024d3f2e9 100644
--- a/kernel/trace/trace_btf.c
+++ b/kernel/trace/trace_btf.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/btf.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/kallsyms.h>
@@ -214,6 +215,12 @@ void btf_trim_retval(unsigned long func, unsigned long *retval, bool *print_retv
 		if (signed_type && !hex)
 			*retval = sign_extend64(*retval, msb);
 		break;
+	case BTF_KIND_PTR:
+		if (!hex && IS_ERR_VALUE(*retval))
+			*fmt = RETVAL_FMT_DEC;
+		else
+			*fmt = RETVAL_FMT_HEX;
+		break;
 	default:
 		*fmt = RETVAL_FMT_HEX;
 		break;
-- 
2.53.0
