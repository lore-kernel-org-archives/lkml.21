Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705435;
	b=vmoG3GJNY46xtnyevbC7YzxxprvOr7J8dwK0TG/uTVGiBxMAQFjO9x3PCwTz9lL6+wQo
	 yUTgGUpDsn4L5gpcZLXqZtkxrU86z0bi2aLYx/A0T3wZFbxbhQ0TE9A2qTXEHfdu99b/C
	 tiq5HIlTLFxCkE9E35l0XVUjrfjIBwiqSnDjiZuIXkcBogp1kMbKt93LieD8xyhwOYxHP
	 7+q8e88Sqk6NOlFMQU0FG88m/FXN5KG/Ie2O62eV2ZoC6RfTYadWP+U85WSdumFTv2nMk
	 /OXBZP1SR+hbsCbvwFXHEbFA6KFdB20Kj4wJlmCVwB7Wn2qOrJMpoAl0lEJ5jL+CTOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PJOfhzzym9DT0EIFhuMmQjcHheutHEEjTA2C5YGcm5c=;
	b=3+PO6Hc4fXdDtXYCmHoHPgQSIx8ClB4aM1NFDdyStED8w6VL69dQ6YfYrClO4U7j6/Xs
	 y52ohblr2FFFxCJdDp7NC+VqiNhkkPHG2jcK6S6ilHMlm9lCaCuQnLQwF8zcwuz6misAW
	 pkGYepfuk9GI19rbwRplgORykniGc783CRjz3+EMTYk2c3IrcsXA3W607ReWojrL3MF4w
	 NxoApioGYsgPGoxJ4DEAgQHEhTUKSjtbxW4Ymaqc/Hifq/jtiOKY0lqOEW/7RaILpliUi
	 48iZZ4JPXFb5KY201JAEZ+aB+lt5jFR6OLSkOduth7A9SVZS5TxUQ0x8RCCQwlD1QRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=CUz4qxTa;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C1F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C1F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=CUz4qxTa
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386b8f2f671so3992859eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705433; x=1796310233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJOfhzzym9DT0EIFhuMmQjcHheutHEEjTA2C5YGcm5c=;
        b=CUz4qxTaHsZSn2Z5cIKiNHsqeDxLJG/OyCSgr3La1Dixk2LDnNf5+nfaTHtvhyDTki
         lpqxJEz7tK+ko9GG1vyJt9DtBaX1QKnq4kQtrtvZQg3T81fa95rO3R2ZCdRcB6iiKNiQ
         IVwLcJMXE6thEag8L9KzHtYzg+mDZCmIF4Cow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705433; x=1796310233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PJOfhzzym9DT0EIFhuMmQjcHheutHEEjTA2C5YGcm5c=;
        b=hiEcE4EAdnwWckliNcIjRXVMcrgzWl+7rwDSXP1FXhIeF8QE/0uOlK9HSexsMgHrpg
         x4O1Hy5rZsZoybPXj8WvYhf5mpKp22tJtEEBSXFcN5wJWG6NFlL477mjT9f+8Tsldhiw
         a7fjlvFXO9lYPo3Au199ulrDeBQhSmnEragL9rh7OcRdORIlaCMWUJiUzgxA2tlP0rJf
         E7ZRB2Ayj2YJNC46ycDoH98plGYoC6Ua2hRgdjMakWVG1X07n1c/1onuZWXzD/MTYmzU
         vgiBoPfH/hfggcZsQbSLkaYzrQtfbzYaoSol/VAhBUUj9d0PUbkMupWs9eLF4b1c2b2b
         m7Pw==
X-Forwarded-Encrypted: i=1; AL+hErEDdfqPea0R8YYdLFP9N/YY9sqTVmkmoabiMyyA7e3W4kgH/tMvVoesDLR7/heMwdJUzSh7mTIEITo8QAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yjZnc+YT3yOHoxqWj/1PCwXcy5D83t6sm3L+XNW9UI4M+a96j
	aCAdR7k6o0WPmI5auIBKX6wz/Zd8443xXcuLEAL/FZfWEpvEY/JZtX/ZJEcU2sTFm60=
X-Gm-Gg: AZFdTZdSaAnyDJa0eqKqUbjdIdc0B8gaK+9BCSTDBQenOaCPcjI3qqRpzo8rug8DJBT
	q8bKY51NroxpyIfDVjBehu5uFVpmXrUWlLVQx0AA1J7lUL7BQSUpPh40bpyHPCuvwHXXLqAUpOr
	+oqGpR955jm7/SRN6jITWyTzdDxTKwXsbOn/HI+DRsa5M5kCdGPvlNEc3641nKaZmiEOJT/B0A1
	XlSLDg4xbD3ST3Wqsoz9D7u0lVO1BG+H4awbJCzWFsEYeoNvzEdqaT8qlXuA/Lj04V2AMpQo6m+
	HMhD716j+Vcz3qQQp/So83ocqCjTMErVi6i58XR7xN7ieMGX1mR7o8+k9uhRyZk75P7T5UsaX1r
	/zTJwmfLWAm2Pmczvi9XhS3LLX+2pTPf6hD/uf8kfrb14ozzP5wmhlgBC9TabzgHJ2gH8c/2f+t
	/tLUmay2h4O8Yla5YhRY3BsT3LlYSKG1cskmFjof2igTcsEQIAQ61ciUJZ07TnRNZTzy8ivXyWE
	i8SKe3r/K8OVnuemV9I40r2cWkoIpZvjuzRhrTghQuYU+ErMB/x6VwlvgKZry0rjavJqemoRP+1
	udH7Iy84q3erfHys70cQ9EzPWLOldjzRFLI0GLTNOOnLtAiv5RxH3KfGsrJv7Wq9pCMz6+DiFzr
	Pts4KtoY6FQxx7t4rvODAIaetwff/gDKvsr80jNTOLra72UdTLM6mlFVr6kNu/rcp
X-Received: by 2002:a05:7301:78c1:b0:386:a3fe:44de with SMTP id 5a478bee46e88-386a3fe4616mr15220865eec.28.1795705433115;
        Thu, 26 Nov 2026 07:03:53 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm72602013eec.26.2026.11.26.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:03:52 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Vincent Mailhol <mailhol@kernel.org>,
	linux-can@vger.kernel.org
Cc: kernel@pengutronix.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kapil@presceralabs.ai,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net v2] can: j1939: reject an out-of-range data packet offset
Date: Thu, 26 Nov 2026 20:33:46 +0530
Message-Id: <20261126150346.2110171-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-233959@kernel.org>
References: <sashiko-outbox-233959@kernel.org>
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

Thank you - both findings are right, and I have read each mechanism in the
tree rather than reasoning from the patch.  v3 fixes both and is posted
separately.

[High] session leak in j1939_xtp_rx_dpo_one() on repeated invalid DPO

Correct, and the leak is as described.  j1939_session_cancel() only acts
below J1939_SESSION_WAITING_ABORT:

	if (session->state >= J1939_SESSION_ACTIVE &&
	    session->state < J1939_SESSION_WAITING_ABORT) {
		j1939_tp_set_rxtimeout(session, J1939_XTP_ABORT_TIMEOUT_MS);
		__j1939_session_cancel(session, err);
	}

so on a second out-of-range DPO it does nothing, while the
j1939_session_timers_cancel() in front of it has already cancelled the
500 ms timeout unconditionally.  The session is then on
priv->active_session_list in WAITING_ABORT with no timers, holding its
receive skb and its netdev references, and unregister_netdevice() waits
behind them.

v3 deactivates the session in exactly that case, as
j1939_xtp_rx_rts_session_active() already does for a second RTS.  It tests
the state before the cancel, so the first bad DPO still cancels and lets
the abort frame go out with its timeout running, and only the session that
was already dying is deactivated here.

[Medium] aborted session completed in j1939_session_completed() on EOMA

Correct.  j1939_xtp_rx_eoma_one() checks the PGN and the message size and
not session->state, so an EOMA arriving inside the abort window completes
the session.

One clarification on where it comes from: j1939_session_completed() has
always called j1939_sk_recv() on a receive session, so an aborted session's
data could reach the sockets before this series too.  What v2 changed is
the extent - looking the message up at offset 0 hands over the whole
reassembled message rather than one window - and the second
J1939_ERRQUEUE_RX_ABORT you describe is queued either way.  Since v2 made
the delivery whole, the state test belongs with it: v3 returns from
j1939_xtp_rx_eoma_one() when the session is at or past WAITING_ABORT and
leaves the session to the abort path.

Tested on 7.3.1 with KASAN.  The reproducer from the v1 posting still ends
with the session rejected and no fault, and net/can/j1939/transport.o
builds
clean.

pw-bot: cr
