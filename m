Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135156;
	b=eyXfAWJ3wFksx6oWZjnPlAIBTeggCGrBoeH/e9sbdhxX+YHA+kmF3OsUN808D+A39weC
	 8XQzr2wS9E7GSyGeBiUJopavkj+CFa+4xl7+JEjn2VQi7mcYseTfBosX8K4Dmk1LNIZnr
	 BIDCRGG2g+4fbq+6ZfbaTWXP3Hf59qnszguTfpeajwTPPXAsS2sMbslzUtOAN/823f6MB
	 foxYQkzGZgzhym44ZGYS3mA25nRlj++FLzeanBBxnoYU/Uvur9Xr++PN7ee9lW+OFyAyP
	 WzptdXxZP1BsRyP3+JFV+70Y93FVpJvW7gfs7L4u4rpVOM5EqVNz0FZ38g+umlV3rRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Message-ID:Subject:To:Cc:In-Reply-To:References:MIME-Version:
	 Date:Content-Type:Content-Transfer-Encoding;
	bh=5gxwyGctvojwIiXOCGBcUPizSCDvTG4IBxX7KHgzhdg=;
	b=DIcHEbHiAL9RiIjzyg4Kqe78DjbUK7dNtFpuIw9rV1Co/axTowaEMy4aeepwxlyHJggI
	 t+EE5K0x1tuJ8uhdp7xjUDlk49EbF4LEFhPwAjocz17+rFibW4rBPodzU9VXyoLjoN5lQ
	 e5ayGDzZGdnPezXz9eku+LhGI714cSCPC44gx2enhz5Bm9r77D2swhTzLqtecI3UkwDd6
	 pMr4nWK91RBVXps/YL8s3WvCi6rtF1V6CbrDT7ymlSIdlGPSkb2UkW0lnLwlseYYUDuW+
	 5CVxmvJPPrky1C155CyNThIOtK/sCNwBnSThPUn4ziq9gwU1tZ8k36SmC6JX7M4xXDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXIrbsRs;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EB3606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EB3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXIrbsRs
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so426125c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135155; x=1795739955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:cc:to:subject:message-id:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gxwyGctvojwIiXOCGBcUPizSCDvTG4IBxX7KHgzhdg=;
        b=AXIrbsRssxXaO3w8GrpTDhyAHBoe8gHl6vr1AgWK/cwk9Q07YyUHncFHncJa46UUL3
         TgmkdDVvNftjYQdNRFgZsqI49nDzWumOSnYxV8wcUZs5Gcnn3anIwpCjKujLDJwmC8iK
         6ZK6VAZw9CgJl7Df/Bzv063r+hBx0B4fidZsdWJ1jC9OEal3iZJMf2BxLf882Td28SIX
         Wz+DJjNddHav9pLJ2ujtZ60os7JcAtjRIXP90PgnT+QSy1hSyARUgJcqpbzkKFaDOm2z
         mIqhczej3xSQrEXsLvf0mbJQVNl2nG2Qp8a8zIM9aNMdpQWUM+0SIaeq3USPn5pQh7m9
         qPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135155; x=1795739955;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:cc:to:subject:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5gxwyGctvojwIiXOCGBcUPizSCDvTG4IBxX7KHgzhdg=;
        b=aknrzoKBwrvkPgs05lm4zE5WQu8AfqM0V2VW2RKsG5GhFHBpi54GLFQeVtLWn2aPL0
         d548Q4bCNQ7kP+4mcG1fYddnl1beS9kJ2hg41/NMPrE2tAtFrddn/3kFG5K8zU9i9x6q
         ypaqYewlbf+hsjwH/KJC6zt9UyZ3xVqmMa0PXK1X9fYxctbMhHFkqKgrhtkK1VDmaypi
         qiZTF+4YgwXn4lNQ3N9fQTWj7qDi7yDn5ge19zTTNT1uK1lnepxu+lTJ54U0NhjCDF5s
         JnICUIMPebneJexeykdXUSfaqsdlvMAd4Au/LLiJNGmk4Ho1h7YbiYO2VHDUGxriirO2
         V2ug==
X-Forwarded-Encrypted: i=1; AL+hErHe85TGgiZfkSohnCYoivczbD+4JCQGj3124M53dL645owUnMgvbwiLJ4c5hSYt9g57ZfTW5Yjn2DXudbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pq6UlphdPJSB2Kg9mKwCQz5GTgHPIDoBJRB9NULqvzB2Nl7fe
	NOkx7b/X8mqK187n8DkZ9wPcNFUTIDGQK51ZKmAloFo6WBODEkEyEovO
X-Gm-Gg: AYBFou3tmTTv3NsZwUqF8k3Xq1uq02rSKYwsFjkX+B6dDJRicjgaYEgkLi8+pQJKC+0
	/qhcU1sLke4mh6VaTlOgtbwNuiDy+vfEs2gQ7FP1oty6/5+W+QPzq1/AQgECaYrk4G5aulLdCmJ
	ZkvMl8Ol+PcIwUL8cwK7yclZ52hJhs8+WmpUIeTNgH1pthcnIw4iKVd3PKUZ1rqQjxYnmd/TwC4
	64RptPBrkRNQ86TwmJBGcLRwfY+JU9FTU/GW+9CAsHN3nqmGeSSLScqV7/CiE3DhH8yyHNrhNQF
	pV6EoCUjLw8So7LlDIgxcbsaK6ZNelZg/WI41jDTqJeoPcqNRFK8XSWbctC3IPw7bBU2mQUu3T1
	7o/COROSzrkb5j4UNnqW9vqxjvcVK1hgJ2yRSNgjN+232qxaQNfZitnUIfh2NoCVLm+5DKZennA
	kz3WDYUIHNwuYFyO7U2Awvw6YJNYXVUT6xDcfXS+vt9W1aGVIolsg1F6nRp1kPbwsOg061AfbgR
	ZHGsbjtEoGGFVx8/EUJOpLPB8VZ7Ja8IE9g8gy+F61gnoGeCa9aZbvx+1frsegtNFla+jH7nkXP
	S3byX/bxorGWCd2MR1NLi0rMkKn4Ny81SueEPeslH/n27UuspOBLGSWh4RKuULPtGTFob5FVMk3
	uoRR9FnupUNDYbnSEuxQZzyQsIC1XanxHUMaBg4n7AtgMpGxOUOA=
X-Received: by 2002:a05:701b:4555:20b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b556947286mr1278313c88.41.1795135154985;
        Thu, 19 Nov 2026 16:39:14 -0800 (PST)
Received: from [127.0.0.1] (ip68-107-67-45.sd.sd.cox.net. [68.107.67.45])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm2184747c88.10.2026.11.19.16.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:39:14 -0800 (PST)
From: jasmeet.bhatia.us@gmail.com
Message-ID: <32909f9cc196a161bf380b6f64603b75@gmail.com>
Subject: Re: [PATCH v1 0/2] efi/tpm: Preserve event log without changing x86
 E820
To: ilias.apalodimas@linaro.org
Cc: ardb@kernel.org, rafael@kernel.org, pavel@ucw.cz, linux-efi@vger.kernel.org, linux-pm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <CAC_iWjJ1L5MYWy2vHG3AHYcfqx7urJmaTYP7vuyvZm8GSnWCDw@mail.gmail.com>
References: <cover.1788259938.git.jasmeet.bhatia.us@gmail.com>
 <a9e23066-aa75-44be-ac3b-9a15f4cf6047@app.fastmail.com>
 <DL6NCV1KQ9F9.6K6XZQCS4AF3@gmail.com>
 <c3ca811b-a6eb-4f4d-bbb2-4feef02e3db2@app.fastmail.com>
 <CAC_iWjL9jDsRaU7kEemYfwk292Nxa49cK0Rq=81pC=FWNRDhvg@mail.gmail.com>
 <b66f68b5220ddcadddb41340d3ea3388@gmail.com>
 <CAC_iWjJ1L5MYWy2vHG3AHYcfqx7urJmaTYP7vuyvZm8GSnWCDw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 00:39:13 +0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Ilias,

On Wed Nov 18, 2026 at 10:11 PM -08:00, Ilias Apalodimas wrote:
> Hi Jasmeet,
> 
> On Wed, 18 Nov 2026 at 04:57, <jasmeet.bhatia.us@gmail.com> wrote:
> >
> > Hi Ard and Ilias,
> >
> > I wanted to follow up on this discussion after a couple of months.
> > My bad at being slow, at keep this discussion moving.
> >
> > Has there been any more considerations with the preferred approach,
> > regarding the EFI TPM event log reference and kexec?
> >
> > This issue is still relevant to Framework 16 owners and the temporary
> > fix has been confirmed to work for other users despite not being a
> > proper fix to this issue.
> >
> > I'm always happy to prepare and test any patches once we decide what
> > direction we want to move forward towards!
> 
> Ard suggested we discard the EventLog on kexecs and I agree that in
> its current state it doesn't offer much to security. Is there any
> specific reason you want it to survive?
> 

No, I don't have a specific reason to preseve the TPM event log across
kexec. My original patch only preserved it to avoid adding any
regressions, but I do agree that not preserving the event log would
simplify things greatly, and I can't think of it providing much value.

I'm hoping that will allow us to return back to the EFI_LOADER_DATA and
the E820 instability issue that was causing hibernation failures on
Framework laptops, and possibly other devices.

If you and Ard are comfortable with that approach, I'd be happy to prep
that patch and test it!

Thanks again for the guidance!

Jazz

