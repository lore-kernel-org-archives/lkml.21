Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542193;
	b=H5qRPPy6Mi1+rD2Uj1piTaOOF3SSdoMnP7303jPaFVns+lANXCSnwpqu4WRJy2iKLIM2
	 qKLN0M/79NFa5PXbiCzheX2j1JWbgkEbwRF1mookMUH3KflryVuxX9Za/kGEiLUWfMyiM
	 /cmUxOMX5IXIKEX9bvmTQIVoUUB506JewySJbUaSAbIM5aDwMh1K+mN6/5TbG81Gg/8yV
	 VssCeC5Q9fqV5uiBkyhuiQSao7h+D13hH8VLsGnXjjiRdPArA7Q9QctJyaSDhw5dhgRSZ
	 5nV6xwuwV+76003KdBFd//1i7Wc4SYCOEw2NpJR8mPnf9gMTGh/PW6zesoYaCTuoCXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=sGwL+rAjN7ROYVGUA8Ywk3WhpiIIp3H2Jwa6afAFCVc=;
	b=g9oprSnZ8FQE75a6JdMNS2CwGoZkehuntQOD95Avo0nJtq4r9mr1mNh6EbQ2aWbzSouD
	 vk7mSiIu5JbgX3/pu6IYlIB3HQder2CToPbnGshbsNfWxPvZtL6zq39a+TE7+KnLwjV06
	 k7Oci66jbLJd/8zsQ5ueddGQVm62nD6YZnUXKGJcNQ0UBHICPHRGem/TAzKhBg8+BPV9i
	 lYu5UFNPorqFdvj2L8NyE3M/w4f8grWSuoLYnKvGO+ew07sRQ2Ai7n6LIfqrL7yilhWhz
	 IjIl+TGzav+H0QFA2v2GRo6BKkZpRgvdd4WW7VOLqFKXNUZk+9Sv6jGnY/67CArUlyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Bm4z767w;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897ED606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 897ED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Bm4z767w
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5126505cb3so623041166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795542190; x=1796146990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGwL+rAjN7ROYVGUA8Ywk3WhpiIIp3H2Jwa6afAFCVc=;
        b=Bm4z767wH6sKdGF1dg8gpYJbGb9K8flm48M9Aw2Sx8MKkoLSiawioVLFYNkWy4XjPe
         Jp5HwzhBcxsPDX8WC9hCrBD7Sq+RQ/LWenCE59EnPcM5PE+XCD+VqW48CdLAVAtQ7WZT
         KishY9+GAL2PBhHxTCqRUmYDMdrxnunZumlX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542190; x=1796146990;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGwL+rAjN7ROYVGUA8Ywk3WhpiIIp3H2Jwa6afAFCVc=;
        b=SFbcjXB9KpXyErL8X6TiO2zV22Oi6QeIBITUywxD+w0FHtY13gMvqYcw2UTU13VFw5
         KP8Vec8owlS2lcgXG9bsj+39RAYgOoxw7Xk/ngaCNz1AXARVJMvrpPcEsnq7FXZJIA83
         984oOoBly51h8nQ1rDqNlOUC13b8nm8DOBHrF/p8viL6QhfmHFE4LPHWgnujZo0FKYav
         afsGX0i+OhIhEJesF+8wTmlD8tBxrX9xuELqMrADGO0hDuFGNuwh7aLswmtZ78uK9bPy
         zDHY/IPG+OjyQPbjWkwUrazECvtdGJMELTHpYUd6t6bfNUqy4aYJEX7M28GwF14fwb7a
         XTQw==
X-Forwarded-Encrypted: i=1; AL+hErFLAtLyc5vIrtK+RlPfNdoK/ycXwMUpKqOvP9/Br0jkBFCwk0XA6YjBnDloExG8x2vTAES1vgSLcVjoNcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SRbjFeSbubaQQt7N68EQGsuh8jBJLuPhoG6R/D0l/TF8jzjof
	nCxnBW6AoKTQGMypOuVGfgWbwepHqYSsg3kPgoix49Z3uufd21P3s6Oahm/EInRG9Coj0t5CDKX
	QMaMePG2E+A==
X-Gm-Gg: AZFdTZdFF9rmZO+beleGR6i19qYXQuaymvqpM5uIP8BMrWWfoW819xivOJioi+ZBLKy
	ya7l8Yi1GLs9GrUXw9bQzoEWXlA23RLD8PjZENZbIbgns69QnQAOxwDH1BRv77rfnyM0LAZDWFV
	vT8v8OiM1+8ppL18VWWifjK11EIZb5jr9nehHc68nocrD0oKi/xWK9rcnJD1mKMlSlnNHXZ5Py3
	puCtHDXSZvYilF5j7g1X7h4ve4VaL3pRAhOqnkwR0Gv090fxrk0f/DiXZY2nyGtUXlWmdavoytk
	JFBUQOc97ap049pA/Sk5brSJGFZjm06RFbUh38avN+HJVkmpUf2MyeT6CgSCB00c7mSCOwONeHI
	Te4E1ALEa6u/x3tPRUWE1YlNjOuZcoTg9pONBK6mjht4aBjAqV2dcwU+A0VHX/SPjx0VVJpcaTq
	9d9gsnhq+kLoxas9N6vCDhZPm1ldCNgko3/O5qzjq/lXQmKFVDRhsQMZxGiWQXsWf7y5Ee3IBkL
	ntPdqffdTH+bZyt4sDt5yHHYMfH2DSLmvuOOiH04/7qUDbgZLrUglzjlT7awxogmIqdDKCfTugv
	ff8clrhUlKo6AecoKYRjVGRt8AdMXSOr7V1Wjp4UMgvLwnXcZUXyMKSq9bM/SVuNlvYB6ano6qh
	YH/8=
X-Received: by 2002:a17:906:3b04:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c513ab47f35mr979494366b.35.1795542190468;
        Tue, 24 Nov 2026 09:43:10 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm564347366b.4.2026.11.24.09.43.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:43:09 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d581da0aaso673706366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:43:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGQx3Yq9pbvtR4aOl6fSJNU5FG/+hy+qLFyGTBag+mOLFvt0TUDKdYe90eMN52rJr6TRE04Ahyphk39xXg=@vger.kernel.org
X-Received: by 2002:a17:907:a88e:b0:c42:5363:38dc with SMTP id
 a640c23a62f3a-c513ab0e03fmr1346144566b.25.1795542189561; Tue, 24 Nov 2026
 09:43:09 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 09:43:09 -0800
From: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
References: <20261122-b4-sched-wait-intr-head-v2-0-4a764b64e8ce@columbia.edu>
 <20261122-b4-sched-wait-intr-head-v2-1-4a764b64e8ce@columbia.edu>
 <CAHk-=wj_eqNh+gNhCQh3exrL5Pmo5hbZBcL0W-4Ah_Nw0Kegzw@mail.gmail.com>
 <awWSwmvaTwBxfU-r@redhat.com> <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
 <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 09:43:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiBBNtcLyu2fq47oXi-v2hX02m2=xFiG7tNa_hssaMNTw@mail.gmail.com>
X-Gm-Features: Aa3M54qKnfQZwxI-mjKB8QHeQk1--kc11z_QwsMG6NLOaQrTy8GdH9me-KahpT4
Message-ID: <CAHk-=wiBBNtcLyu2fq47oXi-v2hX02m2=xFiG7tNa_hssaMNTw@mail.gmail.com>
Subject: [PATCH 1/7] sctp: don't let a blocked reader take write-space wakeups
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Nov 2026 17:33:14 -0800
Subject: [PATCH 1/7] sctp: don't let a blocked reader take write-space wakeups

sctp_wait_for_packet() waits exclusively on sk_sleep() with the default
autoremove wake function, so it accepts any wakeup and consumes it.

Then __sctp_write_space() sends EPOLLOUT with a wake-one wakeup:
sctp_wait_for_packet() wakes up, finds no data, goes back to sleep, and
the walk stops.

End result: anybody else queued behind it that was waiting for EPOLLOUT
will never see it.

Filter on EPOLLIN | EPOLLERR like receiver_wake_function() in
net/core/datagram.c.  State changes (using sock_def_wakeup()) use an
unkeyed wake-all and still get through and will ignore the exclusive
nature of sctp_wait_for_packet().

Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Cc: Xin Long <lucien.xin@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 net/sctp/socket.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index bc68af88e271..85ac4952e9cb 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -9070,6 +9070,15 @@ static int sctp_msghdr_parse(const struct
msghdr *msg, struct sctp_cmsgs *cmsgs)
 	return 0;
 }

+/* Don't take wakeups for other events, e.g. EPOLLOUT from write space. */
+static int sctp_receiver_wake_function(wait_queue_entry_t *wait,
+				       unsigned int mode, int sync, void *key)
+{
+	if (key && !(key_to_poll(key) & (EPOLLIN | EPOLLERR)))
+		return 0;
+	return autoremove_wake_function(wait, mode, sync, key);
+}
+
 /*
  * Wait for a packet..
  * Note: This function is the same function as in core/datagram.c
@@ -9078,7 +9087,7 @@ static int sctp_msghdr_parse(const struct msghdr
*msg, struct sctp_cmsgs *cmsgs)
 static int sctp_wait_for_packet(struct sock *sk, int *err, long *timeo_p)
 {
 	int error;
-	DEFINE_WAIT(wait);
+	DEFINE_WAIT_FUNC(wait, sctp_receiver_wake_function);

 	prepare_to_wait_exclusive(sk_sleep(sk), &wait, TASK_INTERRUPTIBLE);

-- 
2.56.0.313.g975a75ca90
