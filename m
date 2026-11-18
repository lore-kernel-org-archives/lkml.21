Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009883;
	b=u1uSmLyy67v53IArNGnHt6YAquvJxo36Dcw7faxVLTLAVzSi/rrFr3PybymXubXozhSc
	 qK1jfm7zLlTQ/v3+hlUR72RgrfILh4VTwAxKlyu/NB0Na8IDw8y8Yh7W0XE+4NbiXqER6
	 ZlB1D3CDnEkuyyBE9hDf266CVkJnWonggYt7ItwqHO8FsGCysNKzmSte0TCBdoMR5EmnD
	 0NyS1Jldtm2E0tyvPMcMXgQyAJnB/xGMo1M1bUnHwyYh4oCS+Vn9zdVSQ0Ki6BxDpcrC6
	 erjnBjfaAEWCljJBoG0q1f862uOmSN2BVGOMqR7h5oWALa1bmfMErePVZq4u1x1I3HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MIZ17EJ90TVFSitTF/G0V5tHa5Ryh7rhMmfLDU73SIE=;
	b=khsrvotJsWU0Ou9ilFoTt7Whzvd6cK74s1abETAn6E6c7CAWFrBoMj5TwwamE2hAIUz3
	 pRfNJ61IBmekk9CGG9FQjaQMH3QYWArEIHNALYikpvON54ROW/ZwQWoJ8B65/zFJk0Enf
	 zLITWq/Qt/AZb4+0ACw1X8HAfOxBeeYBD/n58jm8orWnE0mwxcZYxMNWdHtq5HEiAiLmQ
	 fRQjj/xPP0WbF9c3oFs7Z0Sbip8h3rCcaqzmDQjKQIO5pD9qRdd2HrP4FIkb2/k0/e49f
	 81vJ+TMUwC9t3O1ftgzu1qAjTRn4lJ+jc2TmvzCZwVoJ0TL847vDnFFcHBQMZPv6Btg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9SNehBa;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD002606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD002606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9SNehBa
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9653575e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009881; x=1795614681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MIZ17EJ90TVFSitTF/G0V5tHa5Ryh7rhMmfLDU73SIE=;
        b=n9SNehBaVqytzIHepeoxjU3EJaqvDEfpn6SeIG7rGNbatJoEMC97JWUV8pzcEjaALD
         3kSbrOzCfv9fwdttVmYfl4HeNGmHZzo2KXkIj+zoNPIIGALPjic89FLTFJxG7n3p4GZU
         s7ROnGZOQGw8NXCKtrVuk+yiW9OvXOiQzoOaRzSzZJ8wIutEocCTx+AQiP44uYF1VSyF
         Pf1rZtVVzXojGj8oZPMlDGeNoKTazvxLEdyW3NapFJAY5rPKI/WxKG5ArNSt+DX7+chm
         2wQwQVwzbJ8o0q9h2U//41PkRqJUTlHf5evgKbPpY5EzN9QDlB9Mpdl18U/MYpJU9K5n
         W93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009881; x=1795614681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIZ17EJ90TVFSitTF/G0V5tHa5Ryh7rhMmfLDU73SIE=;
        b=ogD/P1RDBvjzRNdmfyZJp4v6GfbizI0CHK6dj/UZOGLdSyb5Gv8v27FRMcJTp1VYLB
         pEA+nio+mW5aivkHra1NeLi82xX6VuDWl2sJnQAF3rGaM0ln2TspRLoF8SHxHP5DtAip
         krtFSSSeOqVN7nYy9QN7vbnd0eZabBC0LFpVAZ2kudG+GBMBqBmQQAMr7Gn7d+/rbSVL
         zfJW7vPt1sv3DvuatS3FOuqxVEyFC46ehMObUuWjbAFKUk7VhLG/3X7Ln9viyFu2wlSY
         M4UEE0O7h88upskTvYx1NQ3ALNbh1oh9d/0YrXX4qvGVgQvRzLZrkNDcPnXcu5dZ5FiS
         6Yjg==
X-Forwarded-Encrypted: i=1; AL+hErGegeuboFmXC423/3SeSUayvJtXUz8oyj6uL98dUbB7ZzGB7becNajVJPVEDHVMXXKA1IRTaxSr+vI+C8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j7n6jBwdYW56KPc8OfEt7jtjt3hMUp8A/k46OCTRfD0Ee1ohi
	zcShrB11rUXadDcoF4JVGJIuEyrzk8LxtnKyAb5CzCsMK3E6FdVaKN/6
X-Gm-Gg: AYBFou3qA/3zzJG7DlaY7bC/fIHJGEwGPm8IZX9MbGM5eghp2PuZ2VaqzdJKEKgZH9O
	NbNUhg2KXh8xdKvAq1TlGx2qB7H7IToY6xrBS0GyOZ5r00tbNeiEWGvRMaRu7A0rjjBqFwQV2aP
	XyTVkiMtIhrYzwQqnNm+bXUCLnLFD2CoHHBzpDZF5m52dqtfLdtv2Gr9xFbPXCx4zhQdt4TtRDd
	pxlYFNG9C0s5FENyH6tSDaCuEIY2zrJ29Kl6eZo4Kwn5D2i2GbsSSGc850V3ozh1y+DzjCZNG3A
	c5dkmDlizblPIWbfC9r9IuB39I0QQ5vwNjB8RaqMQr7uqk5SgbfVx3c4EWI5auvg/8lBKroXOEY
	SsUYBRQXVBcD4fNfn/ksskiuysPhqgJOvw/j4h/zkL810npW01hAqNRCNA7FnF0aSFxoq5Cl6Ks
	FSY1uHI2bG5qb6Njk8ee5b9XL/kb4LKFGzbU3rSYRUUSW2oFJtYboyK5E/UY1nmzVzmZhl5rzQa
	gOB8vEc3oRuohtp+qkN/7RZkIPm585rmBwIQ+sA21OjRyk9AqZ9CkvInv5tDGiQd/p9orw2pjc/
	chtvsUj+r0xxF3LjMDdHTo4IORMbW1Db33bPfiP9iiZKVoS4CmJctDNC1q2Mg3B8YiOd0uW/N0V
	fM74PGEwkg2g5pHC1pTqd3dzk4ZQRRENoVaw=
X-Received: by 2002:a05:600c:5008:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb7da2709fmr53221605e9.20.1795009881082;
        Wed, 18 Nov 2026 05:51:21 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm3926250f8f.15.2026.11.18.05.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:51:20 -0800 (PST)
Date: Wed, 18 Nov 2026 15:51:14 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <r5ro4ebbpapeq6yacjttlc5k2isw6seaazu5ixarm4ackmshtg@a5mampmyaz3b>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>
 <7zevuoiao6ildvkxt5baqnalb3nrx736krdxkbrbxouelukveq@2wo6m6cfl6rn>
 <461f7e59-6c1d-4ad5-9eb9-5e5d9b4a9e90@lunn.ch>
 <uscwfcie3wlbyljcowjvwhto7aecdid7cxjknvd4t6t4fyj5tt@lpyoijsxuduk>
 <601a79c9-0447-4571-8590-998d02bf949e@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <601a79c9-0447-4571-8590-998d02bf949e@lunn.ch>

On 18 Nov 14:19, Andrew Lunn wrote:
>On Wed, Nov 18, 2026 at 12:10:32AM +0200, Janis Edvarts Lacis wrote:
>> On 16 Nov 23:19, Andrew Lunn wrote:
>> > > I am fairly confident the change is correct, as the documentation
>> > > supports it.
>> >
>> > So the LLM review is wrong?
>>
>> No, the review is not wrong. It correctly points out that the budget
>> cannot be exhausted during normal NAPI polling in this driver, which
>> I had missed originally.
>>
>> It correctly identifies that the old code unmasks interrupts even
>> when napi_complete() returns false. My change calls napi_complete_done()
>> before unmasking interrupts and only unmasks them if it returns true,
>> indicating that NAPI polling has completed and interrupts can be re-enabled.
>>
>> Finally, it brings up some pre existing issues that seem to be appropriate
>> for separate patches.
>>
>> If this patch still makes sense as a net-next change, I will update the
>> commit message to explain the ordering and conditional interrupt masking.
>
>I don't think it makes sense since what it is trying to fix can never
>happen.

Understood, thanks for the quick review!

Best regards,
Janis
