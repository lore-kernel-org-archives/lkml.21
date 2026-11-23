Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393279;
	b=NuO9vUHK2yPZrYCTGw6olsTkMBipdCrizuJkRUG21IAW/o+rh08Kr3k2Q9G/hiGJVTuM
	 mfDkXQKN83PAdZAzDlXsweXd6w0kvGd3Zk4GeBaIsB7Dpao1Pa5yYZuKY05V+Lb5C8KX+
	 MkUO+e0hksrxWczdhs1hOrn9jXcgG7LtCmMbhoHuhbddkRYg5kd8m9VPtyj5V+6HZmksC
	 t8mQTrvUFWKVuKyR1J4ajVWKRM5LrHLGVuvHAPRUubIBR5y1A1s9nAyKutiOS/7cLoj4F
	 tiHp1xOqRaOBRy1A+f2r6KPF6W5lfXGig6BwAkoawbw+fFALu9luqho7RHmWvPrDJMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=KF23iyWwR5yZnzbUCvNMaMixSGrIyVPB1oghCsOfI4k=;
	b=xUH7Zd2EPHNRJCeuigAH5G+esckyEySDVjpgXSiA+dRwkB6DT4XHBbUzKGAQD19ZT+n/
	 nx+ykE0rQYWCvN8M5Z8u3A0pODi2+VhUtkclau1dwn6X4fNZ79oT+ZsDkpYxhF6ikRJtO
	 dzk4N07A/OKGVpQjFzihsJczSDwVLdp3oCOuBwdh9tl1Y2wW5A7AD54wkG4sEBDYa62HY
	 2Mitf9WYZcGYlJxPK6Huzpn/hmEsCwcyN8npvK6AUgll30pRD3bioZ90d0M4xqL442fWP
	 K3SKm6ttZgixBVAUZgnnH6pmL5ekc4bUg3wvzDghxNBRzP8ywOaLX34fl5ugiuHJuMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui7qLXEe;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C1606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 278C1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui7qLXEe
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso1076633a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795393278; x=1795998078; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KF23iyWwR5yZnzbUCvNMaMixSGrIyVPB1oghCsOfI4k=;
        b=Ui7qLXEe5JZSNGGNnJt8YRoCIU9BozHUuGdwiGGRpRdbVOmZeySJsVDdurWv9z6VuZ
         VmOigNcxpt4gus56H5t3tfeT+jMthzm64QEJc2zAee84tuc3roRSTwD3Kv0m4dUfr0F+
         4ugqeQMPjbgSS4cdMlpNKVGn/lbd6gTEqFW9TDBlFLcgP5yn4h8g99RzjC8XXY/+LFBY
         IwZpe4ZfiOfxC/PDMkHtsl7/7xATK8AceJkZH0IS98SuaBuBBITDhuqsEsnfsOQEZ/PP
         u3myvmJEKPylm9aDUWQ7+IckA8eVXYDNm+iIKJa0jJHfttZyD/rjsrlkR7z95OGmKQPn
         RqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795393278; x=1795998078;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF23iyWwR5yZnzbUCvNMaMixSGrIyVPB1oghCsOfI4k=;
        b=wnUkf3t7OFidATNWkVtxVRWD0nvEDrIpPil74RixC7SI/wGwzm/s+/OiyGQTC2pz+G
         iGpW5vAGqRCtFJUGPbASdYRMst14knjz+Cb2nveRmr6WcLVM6AyGUNFB49UGL1DTK3Go
         HOlux66nuEaFSd2xkdq/4MjhOdFNj2EvWzMD2hF7PScoBuOJmFrYVhz/nzoqgmD2E6Nc
         rBa1dFe4Tu/11zZWzfLM+8ibPo/eMOgmMb+SvzL2Q0LNcAkaIPI710YH7aIYp4Tw0bmS
         XqD7g7DOjSD53t8JTWWf39OC9i9uneCwCCtmzmNTZGV0sA/1RzYiZhy5zHEir5wp9S85
         eh3A==
X-Forwarded-Encrypted: i=1; AL+hErGuqrrG6IHCZ6r19XXNGT3+W4YwQDtCbWAybCmDGP1qaJMQhHimX1GaKgSmhhLRurR95UkRpnrjF+fTMCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L/K0gapVBfTUu2/8PLkoItJMyinp/Cd+Lu2AdWzDQDrmkTrsa
	5YU+gPpK9HvBeru/rnea2oJqTazGx/IaFgWRMV2DGTlri2kI8sW+OalU
X-Gm-Gg: AZFdTZcqbJK08FJiYxG9ApyihKpkaF/qXcPB1hadBZO1+KC+xyfkV7bqbQkPGi3q6AY
	DvWO7On8excWQWuajAS0fy9jxTmor1+n5Ko7e7KPSJKm1hSL1uqCZQiZMEwaXcu5Gvy+4JpMTkm
	djtBOo8uZCAqHpeJPIGLlrOjWRx59WdfyxqateeN5UyCA2OKYLfthD8YxChDmwlv59CiOmqpVUH
	jgAYSVZtYODzGGHeWILIWKCyRVXXBKU4keMOVze9zFiOoP4FT8PUKgJSaMTBCgHVMQnOFlD1Nhd
	nvnIFH1xppBgsM6viebZtcXXG5+OY9gIk43OpVV3YjfOCchbofMP6cWT0WuhjS2W33Vn5eFIsCL
	fSZzP4Z6uMz3UIIdp0hUrJIuOjI2SAnfZnRAKl8p62viRAqIHKrFlOEq7jqhY8HvOgEJbwC4hDs
	7lPt0EXFFeXvjtu6KTaOy474Bgd42FIypofmNZKsumwiXxhdfNV2RiuPk+HKDr3QYXmMfEA8c8w
	oo3DT0alK8n/G4RM0GIWB0+szRUHSHSfzGt0ORKUU+SbZ9KWcpWsTwlQTEb3AsMa2aPy+v/DC5S
	JM9DvBYeHbjnty8H2eD7segCm569Au3V/MVYazew01sZCY+Dfj7egMOR6u4PYjRZZ9kp/kqfo4b
	MoHNsI9gCS4hkK46IxJTAKkES8ir32yymeWc=
X-Received: by 2002:a17:90b:1801:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b41c8e16efmr9088622a91.11.1795393278264;
        Sun, 22 Nov 2026 16:21:18 -0800 (PST)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm4860403a91.3.2026.11.22.16.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:21:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 00:21:16 +0000
Message-Id: <DN25ST0D5K1J.1NI5236BF2BPY@gmail.com>
Cc: <bpf@vger.kernel.org>, <containers@lists.linux.dev>,
 <linux-api@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-security-module@vger.kernel.org>, "Aleksa Sarai"
 <aleksa@amutable.com>, "Alexander Mikhalitsyn" <alex@amutable.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Andy Lutomirski"
 <luto@amacapital.net>, "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner"
 <brauner@kernel.org>, "David Howells" <dhowells@redhat.com>, "Eric Biggers"
 <ebiggers@kernel.org>, "Giuseppe Scrivano" <giuseppe@scrivano.org>, "Hugh
 Dickins" <hughd@google.com>, "Jan Kara" <jack@suse.cz>, "Jeff Layton"
 <jlayton@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Josef Bacik"
 <josef@toxicpanda.com>, "Kees Cook" <kees@kernel.org>, "KP Singh"
 <kpsingh@kernel.org>, "Lennart Poettering" <lennart@poettering.net>, "Neal
 Gompa" <neal@gompa.dev>, "Oleg Nesterov" <oleg@redhat.com>, "Paul Moore"
 <paul@paul-moore.com>, "Pavel Tikhomirov" <ptikhomirov@virtuozzo.com>,
 "Serge Hallyn" <sergeh@kernel.org>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Zygmunt Krynicki"
 <zygmunt.krynicki@canonical.com>
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-fsdevel@vger.kernel.org>
In-Reply-To: <20261122193539.3334213-1-jarkko@kernel.org>
References: <20261122193539.3334213-1-jarkko@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 22, 2026 at 11:35 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> v6: https://lore.kernel.org/linux-fsdevel/20261122011809.2667684-1-jarkko@kernel.org/

v7 was sent 18 hours after v6. v6 got replies from the bots only.
v1 was +2559 lines. v7 is +5782.
All six findings of sashiko on v6 are still in v7.
None of the seven versions got a reply from the vfs or LSM maintainers.

The way you're spamming people you're only reducing chances of anything going in.

