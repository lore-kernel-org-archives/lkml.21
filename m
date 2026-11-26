Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710285;
	b=x5dJgXaR+Oi2TyIlkPC0pYIDbbcC8PMUu0mtv8Ky5k8qye2FClcllCHoOKlCGgWIgqwQ
	 HN0na80y4pFpiVVNbX+VcRqgMBb4aAskh0wNmbzyhSB3Hnwv5ORsDWPrJJuEds1dT2iAW
	 PcOPptJVw1vHfCaNcOACbmQluAwio6d8WB1e1NCTQZ3D6QRh2KD0eEl/2t5O1mc5mcgYP
	 z8Ns01aqCTVy1ASkAxlT0Cn3xup2p+GJ4NvFleavPfD4BKCW/rewN1Z5qkl43XMx/GhM0
	 8m+FtP+OteA1ULzMHAej46QjRaJ8l0XrzfJYhkmrM03GSqVM0a8fu6NPUSi/lKW0P2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710285;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=hYkM27rp524kTsD+3qeb6RiM+c/f5mZWTKtB7KAjcaE=;
	b=dj8F+MIUYM9HwwW1l+TeVDrFEu2l/9t6F1S9XBt4SOWFJBRVuHKA0VzqtvalOnvnB1v0
	 bnyHsAg+KesTXU+jNqvmFRs3cxv1khKWAzih8k0ZNnX8b6sXHwm3b3uFxFFfqFogpvb91
	 ai/vDRz7FgyiQsbPkYeP1Ajlg1gawRmOPSU11NhNTdloJ4JMaE/2oP/Rx5fe0PlEfcolc
	 xBcVNwL0U14CJT8Q5e+qK0th6bZ1V92CXo/OjWSNxWrTB9ose8HG2zLb838/x639fP76T
	 YhTfLbQB8QE+ojPYSpkC0VIYY9ED9M4FyAv/toQaxjSbRTCQgklWqle4h5SZv1la/lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jalnLucr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3962F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jalnLucr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1201F000ED;
	Thu, 26 Nov 2026 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710284;
	bh=hYkM27rp524kTsD+3qeb6RiM+c/f5mZWTKtB7KAjcaE=;
	h=Date:From:To:Cc:Subject:References;
	b=jalnLucrnuAoku3pOC3WQUHLf8vr/ptnd3thbZzVIbgAuKn47XUhnujLQHuUrxfrC
	 xY7adRnfJwyKwidpP6FNU8SFMKu7L7AJsVMgz/v0/0mtalIKmOT7SBfUvzlxSd57dY
	 OKYHAWno007BTd/AjmMh6OLaLxllOahXV3NOlvMPjhwgLgwDgEz6EhEo6nj2Jk8SO7
	 bJSX1snHjNArxWKP1mpvpd+3ni6UjT4HXVgnkuJzWe93J1wOhSmD+2tCjYK6uAYKmv
	 qzQxDPgWH8M4xmBWssVHdraymi946PIZO3HFL1gJlf0IUBCYOhaCeDptIIjrjS6r75
	 Q5IQJ1ZVYrKGA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH6-00000007bjN-0qfZ;
	Thu, 26 Nov 2026 11:24:44 -0500
Message-ID: <20261126162444.012315771@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:24 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 01/15] tracing: Do not clean up hiter in mmiotrace read function
References: <20261126162423.442922469@kernel.org>
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

From: Steven Rostedt <rostedt@goodmis.org>

When the mmiotrace trace was first created, it allocated a descriptor in
its pipe_open() method. Since there was no pipe_close() method when it was
created (in May of 2008, and pipe_close() was added in December of 2009),
it cleaned up the allocated descriptors in the read.

Now that the clean up is in the pipe_close() method that now exists,
remove the clean up from the read as it is no longer needed.

Also simplify the code by inverting the early exit conditional into a
conditional to perform the logic and get rid of the goto.

Link: https://lore.kernel.org/all/20260715143604.14481-1-gaikwad.dcg@gmail.com/
Link: https://lore.kernel.org/all/20260721211143.36dbd559@gandalf.local.home/

Link: https://patch.msgid.link/20260721212010.76e9ed61@gandalf.local.home
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_mmiotrace.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index 77120d467e11..c49738cdb439 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -143,21 +143,13 @@ static ssize_t mmio_read(struct trace_iterator *iter, struct file *filp,
 		if (!overrun_detected)
 			pr_warn("mmiotrace has lost events\n");
 		overrun_detected = true;
-		goto print_out;
 	}
 
-	if (!hiter || !hiter->dev)
-		return 0;
-
-	mmio_print_pcidev(s, hiter->dev);
-	hiter->dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, hiter->dev);
-
-	if (!hiter->dev) {
-		destroy_header_iter(hiter);
-		iter->private = NULL;
+	if (hiter && hiter->dev) {
+		mmio_print_pcidev(s, hiter->dev);
+		hiter->dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, hiter->dev);
 	}
 
-print_out:
 	ret = trace_seq_to_user(s, ubuf, cnt);
 	return (ret == -EBUSY) ? 0 : ret;
 }
-- 
2.53.0
