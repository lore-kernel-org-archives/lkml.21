Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697598;
	b=2mcGuOi+wnlxI5DPKc0aBWE7G3sXFR0sZyoz1dp39laCunbYqSGiNQvrkVwn+ZF0lSj+
	 Ww41lbhkCWDYLadtygGboYZezhZZDP08C8KvLj6r627uuQl+9EhMpDA5LlfLVYzaCTPon
	 80lNCzF0OKupDOycv1FZ5sJJimpqULWZDmSYenfGuYw+CudwhaBtxdXMy78f8o+wjqZuG
	 KbDyVbRxB7G2UApmia6/HZ6C5e5hNy9j0p63cKPbD3klgMv1O5dVbLkn7FKlMK9zB9mzX
	 3ECTfQXa6HE4sC6RVN92OaLiOGxdAAaUqjH641A6k98wiTheyLH3gPOVXO1ZkolwL3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lGc9B3jyrGJ4akeMJZzBnHn2T1j3IVSiriGjwJai8GE=;
	b=xeREwcPhQg6P6GfYNDgGdx+N9tFpx0WGt9jHxG90DQgLTf/C+3mqY0HgeCLjzzQ/cRxc
	 HH0kSdpUc0GYDcrGRg6oZMnkMa+deN53hZWN4SfgrKVD/b93XFNcKXLExIUhs2m8ViIYO
	 M0mlLNGvxd59BsUZ3ycflp5Gajah6su27kqBP3uw1EOXQUjoz2JcaYDNJ53Jb4tvG+Hm2
	 nTBpl5qXkyuEHdJPvXwUz9ZglVQEbn4DLcGXpns51qfbmLpmUWiQxUE7Dmke9vWyG+PJu
	 aBqAiD2dhOq+lGPa8484NXVZ4TKqEBk1AaN5h0nJmh5llWEIWrUZghw11UgeRZbjABw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FORWBKgw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324BF606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 324BF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FORWBKgw
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so225443e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:53:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697596; cv=none;
        d=google.com; s=arc-20260327;
        b=Ua/8aq2qWUSyAiu/BGIrscDlNO9OZNiIw1pDifk52EzEgeHGfwPlXEkzm9hpf7FCPP
         niYovSrx5e7JlmHsheFV5P8EpLhzf++sQfMVcZSAh3Tgf6ECV4MUdcWnNWvUi8HhzdTB
         uyUEQvAMoUoZzgvDZ5H+2KRXcRpkpzcQy5/zZ/cg9urxL9UUvtzsQe8uaPvQS+rNIRvT
         H0AyAcWew4p66CWj7XSP6Q1pTxh4wsyljhw+wtul2X5MdM18Jpq/whl+aJkWwtGteQ5p
         lvRn33ZjI1Al+F5IZ8LX96mMkHwWmmAttINbtp0SSI+yeHbMs15v4uIQfKlCGrGxl8dx
         Lvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGc9B3jyrGJ4akeMJZzBnHn2T1j3IVSiriGjwJai8GE=;
        fh=fn87R+DpiPQLQKclPjqo9KFH6QHg9DOFEOPr+2B5CCA=;
        b=UBLMBrUnw52clw3PVokgXSSSXDsRT38WHAWZd8Vhov2KoGtpKVm/vylgmNtVfzZQBF
         4C3UEwyg6NBXZCbbFzsOeI1SkU6x6Fn4ABleOWZ/pOClfVFbgOcSAZlBMqtp1Fa0vTL0
         J/DLLrOjniHCqLRhYvYpMbub+CsqILfm53xEYz8jK1CarPqwIYkt2t4v9JhoAcr/9hBW
         M3kO34DNe/pdz1dcFmmlomlpKpjw6SZg9DDrjJUHKp4b1FruPYEQVbosmyhw4wsRcc/A
         kj29DE5Zt/mH8UIkAXS2yWVFEqQqrrtAsPQrkNsFETzhBW6iRbxVXBt+lPTNE1+cix1u
         iCjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697596; x=1796302396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGc9B3jyrGJ4akeMJZzBnHn2T1j3IVSiriGjwJai8GE=;
        b=FORWBKgwsA7he+yhIejYmX3C8mLyffMOydsVSolS5B9UxM/d6GN9EfR/WDQnPxM59i
         I8V6kZ/8BCzmnDAJZDiYTIggQsKvlYEoBOQ6VOaPjuRScNUe+Nv/34RmmjzPre8+QCii
         svin+SE79f2EIjvbqI+at/bTde6GLq2GkUerBK+q3/xO+kSqiqd390kpOWbo0xbmS3EP
         HhgnZyq1/RsPyte70TPtCraHQ1qJScwh0kGrn+u7cLEkNU1RZKh+x4HrDRvojD7cZ9+i
         7ElD/IEkweh4cSXSarOg4tsLELOaArmaKLCFc20DyW0O8+8DAbBqXtCU1of40mjEY1H8
         yXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697596; x=1796302396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGc9B3jyrGJ4akeMJZzBnHn2T1j3IVSiriGjwJai8GE=;
        b=jP3ZGYSAWEqvwz1bD1iKa4LOn596I6dQHo3Evtbc8hNzXn33QGRvX18tTzf/J0PXuN
         00wquA28IP7nK/FJVxQh16MQRaOSgxEb6LYTyXbhKVJaUgWWOCJrdGkMCfryK+e+nVet
         Ltas4ZCljvuf1kOOpOh5jC8tr9GsOunFaMSWufX2OGfHbxIG33LYgIBia8bKlG0uGlIo
         tH/165z9bfAWyC7FzpYfBeGe5jVF2p5J/sfdOP64/UG44IksmjiZ9n3EO1YycO1YLw1P
         vBpoMQivnecisOHK3ejowVt8rPmn2RaBrfle3hfVsyslyrgvfFiq06K35xCvYYShJZrf
         Gxqg==
X-Forwarded-Encrypted: i=1; AL+hErHGr3SyBEkBxM8JaHvGaHRUjM4veTtkHSdvsKwBJZPa2+ebaiSBXO/QfHzjNnESbOo4d77XfLvqCH1NEjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NOKpEpzqamCcDgy/w7w+zfwLOHdzjcS2VhhZ97YOY/5TrjH0E
	Mx00lRQK/ng3cP4YvTmzlmhh2QJZh5KQMFS/nGQOT7Ka8OZJL5Jptjeay0WdajT7rianOuJUqxK
	ywoyc6QdPPazA4N+TsioXNLga+IvmLY4=
X-Gm-Gg: AZFdTZffEJ6+JkbFRFi/A7IH8g81BX9EjhRaVfqGu0hYrkiqAkwO4wXFm5qmfUhrUwj
	K9A5kT6T/HwCWA0bvr+1aMdWbi6HcXh02RSihLNmK7P8Ci08tBPUr20xeWviyluEluZ/vRlGkKY
	0UCyu8CVv8vb4+WoAyoh+6D6gFTignMJrSAbdA+TLgX4YFFYXBK1iFsW0j4WLlbg8NBtSAeKJYI
	Wi+JPfukF0NSO4waMXTsYTln1UzqgtJqkZ/JyU4EDwrt6CGQKBeK1jZ6DwiHWwJb/Ci4JXoqagM
	Y3B589k3f/sR2eQwZzzdRmg+mOpBx6lppN5mfieUBkygfcG3EKPs34S2R9VixBodOWIo8JqHDAB
	n/GZXlYUxSBGqoZkVYr/r2w4TrTbJTdPgFm6u/w==
X-Received: by 2002:a05:6512:6311:b0:5bf:c4d2:b074 with SMTP id
 2adb3069b0e04-5c1bc81b1eemr5244475e87.55.1795697596151; Thu, 26 Nov 2026
 04:53:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124230228.3868519-1-graypanda.inzag@gmail.com> <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
In-Reply-To: <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Thu, 26 Nov 2026 21:53:04 +0900
X-Gm-Features: Aa3M54ptuj7zEv__cM-ZP_znEaMpCD4YLDPrlyY2oJoeO2RPwi4yvnEBtuW6DHg
Message-ID: <CAO7ntTQ0bJGezMUFMoy=_Ns63Pw_1Tbw0_QKtXVoh2Wst26Orw@mail.gmail.com>
Subject: Re: [PATCH net] tcp: avoid NULL skb dereference in zerocopy receive
 with sockmap
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexei,

I noticed Kyuwon Cho already reported the ingress_msg copied_seq issue
last week ("bpf, sockmap: data left in ingress_msg is dropped without
moving copied_seq, and TLS RX then warns"), so I'll drop this patch to
avoid duplicating work.

Thanks,
Junyoung

On Wed, Nov 25, 2026 at 8:28=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Nov 24, 2026 at 03:02 PM Junyoung Jang <graypanda.inzag@gmail.com=
> wrote:
> > Check tcp_recv_skb() before using its result in both paths. Also stop
> > before advancing beyond the last skb in sk_receive_queue. Neither
> > check consumes data in the sockmap ingress queue.
>
> This should be fixed on bpf side. Other readers trust copied_seq too:
>
>   reader                             with stale copied_seq
>   ---------------------------------  ----------------------------
>   tcp_recvmsg_locked()               WARN "TCP recvmsg seq # bug"
>   tcp_read_sock()                    frees new skbs
>   tcp_collapse()                     BUG_ON(offset < 0)
>   tls_strp_load_anchor_with_queue()  WARN_ON_ONCE(!first)
>
>
> pw-bot: cr
