Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795736356;
	b=4d51VjKFZ3B/KHmtRPhqd21+S/EzlbrccwsapzqrL7+d/s+OKoFdKuRVqTk/rOrV+iPZ
	 /xA8pZ2fZ4cGW4SNDkN1h3BaY6esx7Zteb2U5pEFVuq8tB7dU7mQxzlm8X8XOt0dXQcZ1
	 IGgTHF/UbFzwmURzmMD/sOuyKGQSHKPppYgRq9a/x0eZa80OQjJgcyr9e9xcwEVHvUhks
	 W1kKOHMC2WY+q/tqgfwaj1VWFi7bWv76Vz8DPrvM3pO+SbeuZ0qxS8PoozTpeiIp6Xhj4
	 JDUw3jvgBOFJvc8K1ByoDnwunvezaa+GywHnOnnCgVErBPM/ODT09ClBR2y5lq6iZsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795736356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cEPRgmecBtTmpLddQ0go5G5xfJgvmStb5g3HRDJoAQw=;
	b=KWo33mjRmqEZqXHDyZ0pxTCbLlqhE7Aop3ZW1OxKxiq61uWyulETsJhi5NnzraMHJSf3
	 oM1vweMECjqJlu/jLHRVV8iFl+yswK+MwrFVQK+ILi0z6eDj0+mXMm0OZX5s7w1IFVr/W
	 nr6c1qXZqm+22xQVZwT8pgQNzD+V1aZTIkZP1p3iRew7bF6UZYwRuuTMjkNDxx44pCwxE
	 Z5RGvlFgBJnXAWeGytl9RWrggdTZtTihnvR6NZu8u1k+pBr2FUcOnRNkGX1nrvNopi2/I
	 YeeHtuDkix8FhtgqMbhTkPhmbqy4sr0AVHMlEaiefbNYAbq0Sg3W86zYDwSY+Vxi1ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="q/x0QMMd";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F604606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F604606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q/x0QMMd
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5333580f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795736354; x=1796341154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEPRgmecBtTmpLddQ0go5G5xfJgvmStb5g3HRDJoAQw=;
        b=q/x0QMMdeM2yZdmmdOo/Gua/xNBYEnUA11UgrwnpFo5T/WcxvfMPRMgzTmZA6gei1+
         o1guB8E9/1xlA3sKHEusemPWNzkSGbH2PKGkUjL81WBRWooVd+i7TKPKBZORjci0wk2S
         /FcoihlKTf2CSkoZKtLbrU1kqXfUn2DcL8K013K5BpsT0FCaJd9OloRUcyp1thoHErdD
         DzIsqbi0LNsanShahOxPgYLBYo9pT5cGavCXtkegBlkaHFMGHaRNK+V8rIjusrSJWRFK
         7It+XOPEzFGenHQG21e/pIvv0h7P2jhftf0A8re1ROmDKrM4Z1KVzqIRYfD1kYgQvGTJ
         RM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795736354; x=1796341154;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEPRgmecBtTmpLddQ0go5G5xfJgvmStb5g3HRDJoAQw=;
        b=Dj/UWQTMwZXtd5nMzNaT2ktun9KzjypAjqPwXRjykfhf1U2O9NqLqrDNNbPgFUmKRx
         HaUndVaLFFyOr1B1DqaJQDnB9LWTzTb7p6UluzBHhAdyEvZTpDnowMY/Bh0g6EVmF3yz
         Vae2E2BCiDquhye7tDrkcsRJpzImZr7Ckyv0sd4HEXR+CrT+BZobFWFz3q6xFH9Ldwym
         ztqdxn59vDIHeAd+hW6PBmxvWBnGOQo4Tb1nxCHpsscGWvqgT5EYyeeV08L5oL2rjMdU
         DYtry9sWlLJX/vLM9cP01xFQxUFoJOz64mp/3z0LgqtG2dHGdTrQAz0h763r9TKMwpO4
         g/bw==
X-Forwarded-Encrypted: i=1; AL+hErFGfNL5jQHiPzSg4d/bTSkLzlrzkjkjfsne+lE/fFiHVKHKOkbdVfWmPDbJ+VdsNy221nliRi6VoshOcyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rfx9YKmnsXzvo1nx2rV/Ag1/wXBK9kZkn7XK841lLm1K15DLH
	Z4FnSGRB5VnMLK+vaStHUKGogCdCYASUKrhDymQdDVDkPEIkzf1zGHDB3KnVwceJZj8=
X-Gm-Gg: AZFdTZemPp8HMXpuXNc9vLUKmzCj1QG1hOJ26TPCuBv0tAjSWjWruCao9ckjEQrkYti
	P4QsLPX09130HMr6luiTMPtmaap9thExN4lrfaucG/0VNlEBkO4Tm7j9RIiDmzlox9mfLrKTCos
	DqCjFhS4+GoMiqSlkMKzwb7QEhxMO6GR+MXax2KqMv6Ham9DB7XOT8PhkNn5CvRaQsLaL0pwYyT
	RofzRFhg99pMBkr/czrHIiYWeYYEFtjinNh6MzYi/AYSMMVT6d+lc8yNt75qlAC27C/PPAK/9vk
	2Jn9D8btENwc5Cn5x8Wnj0BrqNk7OOjZBqXPY9a5bhR+9cNfVjoyx7vIL/OrQQeuR3WOhgbkr4i
	Nft7737Y+aK3ps7eruNEByH3seIHjtkMfm4Zcvb9Zw2BkfjlxqUV8V3gPRQbfuPJWnrBck3wqD2
	q4j6g7cWN1Xbdi2p+5NWl/3S5VG9HQxQ1j/iDxu/GE8F6QTbyzJqWSVYrLn0u1mFE+NPqwXgF7W
	U9PV1nZei95lnrPJ6+VqqnaLWZa2OSnxBaWEI7C/6sRQXWx02deDXhvU8J5m+TgSQm0Rdwlm6k1
	fsSTp9msaoLNn8BxXT9p1um5cNqfPMttLFIwt++K4P35jMf5BUhUmPSxMibV
X-Received: by 2002:a05:6000:491d:b0:4ab:f5b0:a7fa with SMTP id ffacd0b85a97d-4b598a60967mr25614507f8f.33.1795736354526;
        Thu, 26 Nov 2026 15:39:14 -0800 (PST)
Received: from ehlo.thunderbird.net ([185.253.98.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm20805307f8f.9.2026.11.26.15.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 15:39:13 -0800 (PST)
Date: Thu, 26 Nov 2026 23:39:08 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Christian Loehle <christian.loehle@arm.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_3/3=5D_sched/uclamp=3A_Mov?=
 =?US-ASCII?Q?e_uclamp=5Frq=5F=7Binc=2C_dec=7D=28=29_from_core=2Ec?=
In-Reply-To: <8472ef10-7793-4c3b-99e8-d72983b1e064@arm.com>
References: <20261126012836.15205-1-qyousef@layalina.io> <20261126012836.15205-4-qyousef@layalina.io> <8472ef10-7793-4c3b-99e8-d72983b1e064@arm.com>
Message-ID: <490A8382-07C9-4FE2-8750-F5A273C92EF2@layalina.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 26, 2026 8:53:59 PM UTC, Christian Loehle <christian=2Eloehle@a=
rm=2Ecom> wrote:

>FWIW two of the sashiko findings are unrelated to patch 1 and seem like
>genuine concerns to me=2E
>I guess I'll pick up patch 2 for now with my dequeue-only fix?

Sounds good
