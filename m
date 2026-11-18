Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026680;
	b=CakPa+teQErWq8doepct4gq7YLWJgzogk/nhgk+VgfJ3RFnjpNUex05eQu1F+5oQ8w5W
	 x7zxuT2AVqYSXJNN+bef3dtQ6FDQPn+PnYql7EbuRvq3Tev16+GtxMCMHGlABB9Eworbi
	 6iXldn7m5cArZbkOA24rnTVmdbZFCX9hJdKPUl4D2d4oYsofMnjOY9V37ruRrjCg3XW43
	 ITzf7F+C93diAQUW42a2s5eGeb7sCV9EITt9u4CHtnDXTl3HGUAJU0aNsWEgTh8mlcLzw
	 IocM80yUAQT2tPSjW9xbUk2fJQgYbfLiJbR9hmWMhJrVKSrgZddfbWpXUPA/B4TVO8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=9POCCF331g14iFPj8SgUyVVQk9XQYyGlnQIRNxTupwc=;
	b=yXvjPZ76FQdWJ1xKWEAW8chfM2xV+byHM1sVMUqOevDxiAdN9wREKoGSw/zSQMpqRJ7X
	 /8n2dpyV3ienQ0ie2J+CWSrO7pWj1yE87Rg2UupDb1kTxIuc2N7wIElRxov+P/+eIYGyY
	 BifJMywLlWFsdf+1guv19Wsc66whVn6UPlZSQif/un7R7xMTAQbgdjZvF0KgS88GKqG2u
	 TynPhYtP1CZZ51PmvU1hMk++b5OAOqBdVe2xGTqPPlCv44xhcb1cDdApppqEngTSeBzYr
	 gf5+Pf8pMkP20vNubc7t4VLqaPAdWpn7dIpqwiqv/pNQ2F/IsKl5kIi+BzMiiSA2Emw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=auoZdRQD;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A26A606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A26A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=auoZdRQD
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1129368a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026679; x=1795631479; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9POCCF331g14iFPj8SgUyVVQk9XQYyGlnQIRNxTupwc=;
        b=auoZdRQDm9wfrdrbdjIbIBCmSG3H+wyCTqpETgiOZ/ZVrjPf/Z5J5rXr9zk2jaRvU4
         NUyLxRuq5R2mSeKCH/R/xGndSWd6aCzrE+DNEomvHxguAWsRWmcL594JG74+4bReW/kz
         5xgJZP7myRJS6uGd8xRgF0xYXkNTbh2Kh+qh5t0VhTvS5qV9BiE7iYTwdwf69yfQeg1g
         wbtjVnM/udTY73HHLZOpLFtUZE5zQ/FjLtN2xqp0zovfD6yonneE24oN0a7BiB+ns+JK
         /MBhPzUIKT6vnF2Pfrj3BMg8m8cH+BKqCmqfJEHrwPoq+fRNreIphDfG2Z+2OnHl3yHO
         eGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026679; x=1795631479;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9POCCF331g14iFPj8SgUyVVQk9XQYyGlnQIRNxTupwc=;
        b=0La17VnG8b5G9vOHpEkF0sIGa4rp/IOxuUXwTfXG02oVhYCHTBGjoofLuZxdSpOyno
         Xoxg+mR0XmtkXJe+XtrIX4d6+PE3T8m4rpELU2+QLtCtCvUC/6QIzsseDzyMh5DTaHAQ
         edCxWUXhw83xcORrngy/zwTZtC+sANVEf5SYh9VgT6Lf9sFz7gaGyqBkTQ0WWW5biY0w
         5iCAZTAItc31fv+USbSBv/CWOUp5+4ExY89KiEMYWELcM7IxUBtRkJHf0U5meg4hSbCG
         X9OAEygtKnkW9kTgWFSFFzMBhpXmFswVuwhV860iRPSWrMR+lzbck1KUzJAk7b1sj3fz
         oEPQ==
X-Forwarded-Encrypted: i=1; AL+hErFTJhUIi/guX2qP1UxhT1vX7CtlfihlLooEDYs3EhU/LgpBbgVNbx5LlAEccL5XpaJZgQ9NokT+OIwtfSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jT5toZ65ycRW+56H9TxaM/GMJ61/hevt2BC1wHaXkIzdJsXrI
	Ve9DluLcTVfoZt9pn2gLN7p5mMHvIEfoTo2MkOxdFDmCCG7QJ+a9q7YY
X-Gm-Gg: AZFdTZepu80D73QgbwDV6095DJVSPhewPcXlNEX4KLg191BeNgxO8CHrguhwSQlPm0g
	4QrGtyuoSM5m6/cJrpXOA3t3PTkon6qlgAj04wT5YzREHIVJ7AM4mZznKu0AhEv1uPo+7F3UtxG
	hsfAKZy7RUdv7FzLqKfXRunHX9QhKuTZJJvwx8J0LLIZWIq5wwzag5iUwof0HSp5rR3AX2vcFt3
	/zLX3y+El06JGJTDbOsJmZdhO+Gd9wF0mwP6ua428LM7qqLyZ+rwbljRTMyd14zR2ipjM5zIX/z
	m/fR6Mqa5IeMKvxP7ocy4MAziZurQqM9iWcF8kS4D5JjHk9FFNy3xdMduENR1tFTZ7i9C1Fqcf1
	GFLFAYOQguZqoVdwSSroQa8HJ5I5rVkLE5SH/UDzwsSMFLnkF1iruq+2r8h4HIdtkCxnkFSI73N
	s3l4nHB3IP3qY2wUxPfGH/6wxm1U2kYcpjjyYJNc19rApyy0ARRMytaJESOGK944N0X8bUBygi7
	UTaDpziC9/7Gg4n8hHcxKqbiKiSfX+ABLedo1lcyaJDT99DKuSlsxZTx69gErTrsoH8OgI=
X-Received: by 2002:a17:90a:d445:b0:3b1:4eb6:b3a with SMTP id 98e67ed59e1d1-3b3d0640e47mr3501738a91.8.1795026678945;
        Wed, 18 Nov 2026 10:31:18 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6a94c8fsm421066a91.1.2026.11.18.10.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:31:17 -0800 (PST)
Date: Wed, 18 Nov 2026 10:31:17 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, mptcp@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] mptcp: pm: WARNING in mptcp_check_listen_stop() when listen
 fails on a new endpoint listener
In-Reply-To: <5d651146-b21d-44da-9f15-860f0c9c2dc5@kernel.org>
References: <179502042942.2742790.17887994424282536144@gmail.com>
 <5d651146-b21d-44da-9f15-860f0c9c2dc5@kernel.org>
Message-ID: <179502653236.3033236.9177220287548482679@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Matt,

On 18/11/2026 19:18, Matthieu Baerts wrote:
> Please always decode stacktraces with ./scripts/decode_stacktrace.sh.

I'll keep that in mind and decode them in my next reports.

> Out of curiosity: if your LLM has already analysed the root cause and
> has a reproducer, why not ask to generate a fix and send this patch
> instead of the bug report?

I'm more used to communities like LLVM, which are cautious about
LLM-generated patches, and I was hesitant to send a fix for code I
don't know well, made in a way I couldn't fully judge. So I only sent
the root cause analysis. Thanks for explaining; I'll send a tested
patch with later reports when I can.

For this one we do have a small candidate fix, tested with the
reproducer: it puts the MPTCP socket back to TCP_CLOSE when
__inet_listen_sk() fails. Since you already have a fix for v2, would it
still help if we posted it, or should we leave it to your series?

Thanks,
Kyuwon Cho
