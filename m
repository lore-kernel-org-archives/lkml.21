Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795687676;
	b=IWakeR2zIRX5xBN4t92w6/hUIR4uDhMbRRHBwWXd5bWnSiSH16j3vInObdhDMdO9e6wx
	 zvnJdMZwiEhqgBb4/90HRXVORHnfMp/QT1B91UcgPE7wk/TNCZb19NGXS5snCCJzBYJil
	 2WC/JLW30GF8wFII0fj/LvZKHe4B6gQKIcnSsmnSWCiUzgox4HqROfUDMsUdP/PjXAbD3
	 anzQ5NwYydAi6XpIKAKwtEW0OGgzHPuSg5kjb/EVRITA68EBiTjF17Y9y7nEndXeJk40y
	 vD1eK5cE15vIup+C4UjeUWy7ZP9Fnz5DP61qR5u5ZBbbBzIPKHCKcAH6TZZr1bx7Iaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OFLHVUAo3FlFAtehQFPOjKyjhG5VjODsSSnSDvugi8s=;
	b=kPqv8TGL7Fj6gkT+xjpOdPi4oXK3o1SpKMghVYIAhyrGytdXfKARW/x7H27vUcm8oxQt
	 WaAz5d9emwuezLNdh5tre5MJUSVlfaYjBH6tWOF+LXtj+ntZnrQdreFgEXnwJxkQNkN9F
	 igCOEOjexZ8XQORkFxtlZhcolN8XsVLI0Pb4qdcjxUvMOKHJkHJZ7/lc5jkRiaCe2iSJw
	 +dpJrYdU8Y8ueRpd1wx5HOqXdZ3LJCGnzznoXlMuSUkVnTXmxYTuqmoy9efKLhOU/V7Cp
	 HPXqo3EDjd7UnZkSHUAdAvKlRJWZK2uB9Bla00jnY6pFH3C6WLTgT2WkASK8LhxLHeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDNfsmIy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C067606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C067606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDNfsmIy
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1390442966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795687674; cv=none;
        d=google.com; s=arc-20260327;
        b=dlWWydYGYzwU9wXVU9DKTJVF488TPS5yGX8xZfmrMWG6jLrH6cJpl93GnLUzicMXBH
         ezol2i3srHi2WDlTbYsZ84P1jSUJUinZIjWyrjmOl+qWZZQXTQpaAxo5OQq2olWNUlHf
         XhGaON8CqFvLTmkqwynKdcsrefjXrsWYh2wqFyH/HkngnvEr3pSCOjSmju8vd3B9YmTV
         npOih01mNZak5V2lh+oTMrQRANn6k1nlIuFEUWDCNxlSgomNabRpSeUqrfohYAbbt724
         rnfoVTorSjzZuwQIGaxemyAxhB+boCsVWDSiR2Qx+Ps9pZADCyvbx/tU3GDmqCWxg/wb
         mjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFLHVUAo3FlFAtehQFPOjKyjhG5VjODsSSnSDvugi8s=;
        fh=+DIZp2fZ47WtVkaol86LNrE4KQ2EJZ68LFD9WxHree8=;
        b=r8idz4nso5K+QuW/P3ckGCMVKwNYzuO/U1xBaAuZjH3tXqYrrXJTbqZvm8Ebt90xuI
         7oIS1xltoaATtyaArHiAj8mMy0YMdnBdYqtXmb/2MGls45wfu+IbpTEmpdRPQjr5uiVD
         tpSopXEpMgRKJigHPj1ETHEPjT/vEtm7PSxYGt+3GX1UkJj4QYFYTf4KVoLPW08hRJhT
         WQ3X9LHXj3BSfIvLTD4nO5ee/P0f3fFLoVmweqNd3bkTYH3Yag3kbgNB9mhEJilL5gcL
         EseoBx1qUZmsY06e4BH5G5xeJiZKOVqvW6Et8w9KUeDmTrCfDmbIVMGwesxZoR6HrLix
         vLtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795687674; x=1796292474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFLHVUAo3FlFAtehQFPOjKyjhG5VjODsSSnSDvugi8s=;
        b=XDNfsmIy8t+C8mNoklxc2IRnp4gH+o34qOKLMjqm0AjNm6Wu06mQYEQrDtL/LtqTkJ
         pXg1orkPd04oBJ1SF/pPokrWQcKrxViAI6XvyxLRjcvBvN2UcEI+rgceHCSl2Zw5PWXg
         6gMpfHPqM4wbvh1vb+A2ZqViL+2fPiSfwaZ3+3PjMhWB+Cuq6X59D1tXJLjEPzj59lZQ
         lLkubQvA8AyyBlrXTMJEpguVW6woLQIQx/pqllS8fg+/xyIhIRQdu2WimSf49OCAa+H9
         I9COozQZJJmkbyU56fKCEhLIGJqEmHNbRzfF4ZgmQtMIjEpC4CvgndIBx+qqOPmgWhR6
         ekMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687674; x=1796292474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFLHVUAo3FlFAtehQFPOjKyjhG5VjODsSSnSDvugi8s=;
        b=zEAHPUViPai0yeTArZQxiQ48sLKfA753/Yu7/d65jdkpOu1WmYIr+ZyO1cUi3yN38R
         52AaEEI0OYrAEmbSeKKSUDYhAujt8/xRFph32wTbEIzBuMVKKMsEA+xXe5JOMY5ztgSK
         Dz0Aw95UmgG2NqjX/w0jFVKTQ7Zy+vfKrTwOeu/FE67cxDtTvdLiUXEKOI3TCSTxlBke
         /QhMmUCYZi90c2hrTzwjEJuh8JtOXmi5DzXnEJqGX2lKjCCQ4/HiS3fOzfTjh7FE2l7w
         pML14VsVm9eVJtw2eFreONSeNzzWjH+3XHqhfGzcCLWg2QuWzNrlu7D4YdZxBvYPkywh
         Mfrw==
X-Forwarded-Encrypted: i=1; AL+hErEzGr/RxuL5E6wzBf/gHf7Tya4SM8NkkL3AZO6wHPNbBrgVhaYAxrQoquREG4mWa8Qb4XBAvWdiVImArt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4ohZStnnrykgfUqgnspltE1pI+ry2hJVHuWRyXf2/ovx0QPQG
	BHPoSmrJXT17lEWBe5CGNjXtukZeYQYQZg5naWy2Al/kAMDhN436UJT3SlRc3z0NFEIPaoPbkl8
	0yKO32sfnBZ0w/9Ozv9P5B42A0d5Xxvg=
X-Gm-Gg: AZFdTZegyPvx7cku4HtXNz2p+bhHEAxBVyoYlrt3kSxH/QQYy/EPv61cTYcLV/xuDK7
	ZA9cq3hLKTgqSZnRvfUzhnC6rNHpfPgcZiqlU9cFVpzaskLHvFaQlfR5J2WeS946Phg9fbI2AMF
	B/angnDbHD/zSRhwGZmz3/M5I7zpxb230N03hoo1oAkVHjmC+C52gELktre7EwA3BFfpP0h5i0l
	sxl981w6XlgBoCEZvhnBOvC7ZgGQmxiiRm2sYcaOLJHqU4Pqs1TMu/QuarXrOVrd5HJ/68m8eGJ
	H71JfGkmsKb5YIMsy0Dllhc6CSRpE+GH9JCv9F/0ZiJH1ZQ9Qr8MTx9BrTB8QZ+4rvugbJ2cM8f
	9c7uY2O+glQAnfC/35eRxGj+StqVQuS3opHY5d2XAKma+LWRb5CXTpXttQeKfxhYSyMZew12G2e
	q1xToKmxOEIQLsrBOdgmk=
X-Received: by 2002:a17:907:a88f:b0:c51:45a:1a5a with SMTP id
 a640c23a62f3a-c513a1d1d4dmr1712012466b.0.1795687674332; Thu, 26 Nov 2026
 02:07:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016141208.2641974-1-e.velu@criteo.com> <atJXYHJa4jkUWJmP@kbusch-mbp>
 <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>
 <atJeazM_rJ0uj3vt@kbusch-mbp> <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com>
 <atJk_2FmzjUZYO_Z@kbusch-mbp> <f665dc3e-fc5c-4352-8e41-a46b7ae97946@criteo.com>
 <CAL2JzuwuZp0gg1D7wSn7cdgpnhotnuLP6YpPd-SrdVyqhkeiJw@mail.gmail.com>
 <atqZmctbU0siYmVX@kbusch-mbp> <7fec6534-9e57-4041-8699-72c5950c7e2a@criteo.com>
 <auId5RuBhMFGirJ1@kbusch-mbp>
In-Reply-To: <auId5RuBhMFGirJ1@kbusch-mbp>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Thu, 26 Nov 2026 11:07:41 +0100
X-Gm-Features: Aa3M54olkR-cFqYgfCrRKXNlLLxbmmF0Yq46YOc53exrFo_-QVGBX5tajZfE7sM
Message-ID: <CAL2JzuyZ9C0pGoBR6kBD1p7Hn8DOBVL_XEkENtNqNmad_GdTGg@mail.gmail.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
To: Keith Busch <kbusch@kernel.org>
Cc: Erwan Velu <e.velu@criteo.com>, linux-nvme@lists.infradead.org, axboe@kernel.dk, 
	hch@lst.de, sagi@grimberg.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 28 oct. 2026 =C3=A0 17:08, Keith Busch <kbusch@kernel.org> a =C3=A9=
crit :
[...]
> > This patch is really about matching the spec and it would be probably a
> > great positive impact for many stable users to benefit from this patch.
>
> There's just a gap with the multipath head: if you start up with WCE
> cleared, then turn it on, the head isn't updated to indicate flush
> limits. Let's get that fixed, then I'll queue this up.

Hey Keith,
Any update on this additional patch you mentioned and status on mine ?
Erwan,
