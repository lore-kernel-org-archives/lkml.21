Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596045;
	b=krIzDQFk+BneAQc8Kux4H+71hKzYNtqBt2L1A0vxJM/jmsR9g+UjKz4BqF9USNwHpT/a
	 oRsMqrsT2PgBV0Q4Qe1B6dgnLePY1O88AsBd2LaA/E14SHSI3aVhbs3dJyN3k/Fn91Q/Q
	 mPBHe99CEdnb7eCo8gNmYcOuzYIQw+jnFZ7/+alSRUAGQf7VpE1MjiwlFzOxE2vWfEOKC
	 Sq6iCdpAUWvA2zCDWBQSAJDzysgFl6uqiDks9evUzBzLlwD/w2ZnyNB2El+dgHfcT+4bY
	 xAeNiSSHR0Tgu3ZuawL2R0kzIVgRQPJljF7Q3SuQGHzYcK7sGoMPQUeolP1xuWNT1Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596045;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=MUuoUxxXDC36p8Yj2BuCEVzKWpd/SCortrG82wA3RUI=;
	b=5pjNSivyvgOXS6Vs6I0XPActzWh/sIppHE7Yddd0pFKssCq7gAmbiaVHLywHEEPPJzbC
	 OMiheOhSXc00Jse+jJkzLWvSVybJQgXdNenEEWACdGlfpo1RpxGVKI0pqEhsjrJ2M2FT4
	 7Qg9LfqZ2l0CCLJVMlLGQS/3px1p3rVAmu5RBccsIb2YIl3IheyEPgbTa2Ao1uOG47KAG
	 gqu+7/okOjry8APCT+W5Rrl5rwlM73wb2RK0iq69RXFX/blPYp/+nkxyTJ5LxIMyKAlfp
	 hu8Lff5CvU/D0eGANBqQfSq/N3lBVXKEGjDBF+FI2lii8nStMZX/XQ0VU07chDImrhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KDi9qGpX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8ylpiDbC;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A317B606A33C;
	Wed, 25 Nov 2026 08:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A317B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KDi9qGpX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8ylpiDbC
Date: Wed, 25 Nov 2026 08:40:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596042;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUuoUxxXDC36p8Yj2BuCEVzKWpd/SCortrG82wA3RUI=;
	b=KDi9qGpXchxAvZQbw7bhXuJwnXEKeOX1SOOj294nQFm/U3jiLezaZsVy7Cx7p4N3N9+zTG
	bE3grOt+YWBS4yZqx5ikgvQduSQIbPPtD5hN/uuXjucbLqEkVOSkEYdnzzleAssFdkyQdB
	bnlWFu7Che0/pJA9JR3fd6eyIeXJvJco31W6ylrTPwQ8MbXWiQ9Kyj6WQ7se8fSBTzN/jj
	3NuyVgb2sM6fqd2WD5SI4vZ/DMxGQCw/C01B7hsUfF/6B2vXENAWXU4xHN7SzHLYLZ90TI
	NIjjXELLDEgiJVj6dHVwbc7c8Xvxyzt/sMkqzkFmrZTmwzsMMlM4ML4IK4X1ZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596042;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUuoUxxXDC36p8Yj2BuCEVzKWpd/SCortrG82wA3RUI=;
	b=8ylpiDbCsN0fGJkcjQoPsORvm/4JPMLtybUUCzigwQUzecg/OE9YQ9gnpk4hBxx+Fy5Hc5
	qWOhvLCz5aVhUFBQ==
From: "tip-bot2 for Alexander Moch" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool: Fix signal handler stack size calculation
Cc: Alexander Moch <mail@alexmoch.com>, Lucas De Marchi <ldemarchi@nvidia.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260920143815.32426-1-mail@alexmoch.com>
References: <20260920143815.32426-1-mail@alexmoch.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559604053.92412.8629435299160467850.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     244c6190fc44547c5bd8e5a9d927aa354bbf8737
Gitweb:        https://git.kernel.org/tip/244c6190fc44547c5bd8e5a9d927aa354bb=
f8737
Author:        Alexander Moch <mail@alexmoch.com>
AuthorDate:    Sun, 20 Sep 2026 16:38:15 +02:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:38:32 -08:00

objtool: Fix signal handler stack size calculation

init_signal_handler() allocates its alternate signal stack with SIGSTKSZ.
Built against musl on x86-64 that is a compile-time 8192, whatever the CPU
it ends up running on turns out to need.

The C library refuses a stack below its own minimum, and that minimum
follows the kernel: musl's sigaltstack() rejects anything smaller than
sysconf(_SC_MINSIGSTKSZ), which it derives from AT_MINSIGSTKSZ, and the
kernel grows that figure with the xsave area.  On a machine with AMX it is
11952, so the 8192 objtool asks for is refused and objtool exits before
doing any work:

  error: objtool [signal.c:118]: init_signal_handler: sigaltstack failed: Out=
 of memory

Ask the kernel instead of assuming.  It publishes the size a signal frame
needs as AT_MINSIGSTKSZ, and the handler still has to run in what is left
above that, so add SIGSTKSZ on top, which is what
tools/testing/selftests/x86/sigaltstack.c already does.  Where the auxv
entry is absent, before v5.14, getauxval() returns 0 and the result is
SIGSTKSZ, as today.

Fixes: 799647ddb4c0 ("objtool: Add more robust signal error handling, detect =
and warn about stack overflows")
Signed-off-by: Alexander Moch <mail@alexmoch.com>
Reviewed-by: Lucas De Marchi <ldemarchi@nvidia.com>
Link: https://patch.msgid.link/20260920143815.32426-1-mail@alexmoch.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/signal.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/signal.c b/tools/objtool/signal.c
index af5c65c..bd7b7d6 100644
--- a/tools/objtool/signal.c
+++ b/tools/objtool/signal.c
@@ -9,11 +9,16 @@
 #include <signal.h>
 #include <unistd.h>
 #include <sys/resource.h>
+#include <sys/auxv.h>
 #include <string.h>
=20
 #include <objtool/objtool.h>
 #include <objtool/warn.h>
=20
+#ifndef AT_MINSIGSTKSZ
+#define AT_MINSIGSTKSZ	51
+#endif
+
 static unsigned long stack_limit;
=20
 static bool is_stack_overflow(void *fault_addr)
@@ -101,17 +106,20 @@ int init_signal_handler(void)
 {
 	int signals[] =3D {SIGSEGV, SIGBUS, SIGILL, SIGABRT};
 	struct sigaction sa;
+	size_t stack_size;
 	stack_t ss;
=20
 	if (read_stack_limit())
 		return -1;
=20
-	ss.ss_sp =3D malloc(SIGSTKSZ);
+	stack_size =3D getauxval(AT_MINSIGSTKSZ) + SIGSTKSZ;
+
+	ss.ss_sp =3D malloc(stack_size);
 	if (!ss.ss_sp) {
 		ERROR_GLIBC("malloc");
 		return -1;
 	}
-	ss.ss_size =3D SIGSTKSZ;
+	ss.ss_size =3D stack_size;
 	ss.ss_flags =3D 0;
=20
 	if (sigaltstack(&ss, NULL) =3D=3D -1) {
