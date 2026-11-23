Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434070;
	b=Bulx6jXuIzltPAEeksXY3D57v2z0EQhQHoRJfDXi8lR2PZJyn1TplSROdEni2JwZTtK9
	 amNdFv2B6//VmFyMtdaf0XNsSgIm64fnrBi0jVR3jtgfbCGf7+Ou3RiLzMfx+/0DqHF1F
	 US9usb2twIeI1Ir/PeRBvh+9A1G1dQDrT/a+rIshlCsiCOHf8tR26pHwrxZZW7oZzsTDg
	 23LMWsiG7SquB9xyYgc9SdG9RO9Ral65HE0InFMmclXTebl05o9zAuMmVmjVHJzzXVC2U
	 FHOmf2/tI4s2w3pOEoSlvD+3+i/Kj4CST1jBteMzCnHEFOVRNCaEI1vFHMtF7r/s3QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F8UfxySGOv1BnhxOIHb7TZOrVtDzm4+SYsgNqgsm3UU=;
	b=FVo9JXIrMoNMA0f8gVo1mfMRKThWkC3WVTqzwlARkE7mkOoWI4y8/95WGonR6nHGmpXT
	 srjZrtno3Dz88/EvZJIeZ4Q24CjAr7h7jPnHMcy2cKWHMMVDyOmUWUul4gHQQEBZ3v/U/
	 gxhqQlSAIwPL9/QEfmTOomnNf99+4/qRw2jPMl6t17pF8eSfJILFtZsXnnBtVxdBLMTUc
	 BcSxKw0W2zUwYiT1nIUry8WAQ+PghG8w7hWwdL6jIuh+oAyE2dobH2+e2IPL7h21KpWqD
	 FjhASXSC4q7Xaa+/9MleF/aiKAijHmxZ6jZNMgjG3ZChVEBWGB9jbL8MUorDWj6wp3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=J08bLTro;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0B7606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A0B7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=J08bLTro
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so40000355e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795434068; x=1796038868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8UfxySGOv1BnhxOIHb7TZOrVtDzm4+SYsgNqgsm3UU=;
        b=J08bLTrowdgJPgjhkkBH+cXrotJoMXPemIQ4IlNLhjvUsvEXaRek0D+f3nVkoBcNkh
         4tYINQfWwWQYjZJIlLQN7nHRU5q0XXX7krCcQyjlax7TWO7IePBcmfPUf+Mr6jhXfDCk
         H3bhw/sV2MAVi+2jL0qxEeFIoxAWTK29mrR0a67pf0Ds86fuCZPFR+XxshrI8rgaivJB
         x/xrLo5p9ErhpMb6qjIVcyaFLdwNrebz2W33vCrRZSQqllNBEcP7PTqtwNRxdu4XzMWy
         b5ahG1Oh+3zy2Vlxntkrt2K0Xb9n5G26GmZlA7sg3+MVUM6Ss/I7lxY1+LPE8HHVQ6sv
         k6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434068; x=1796038868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8UfxySGOv1BnhxOIHb7TZOrVtDzm4+SYsgNqgsm3UU=;
        b=W3WBRwPUcwdXcGfCkfL3nh6Ewh/7nrsoh3w9KCSZgW19KR6QUMkJW43ssicVH9ihgJ
         SqK45MI1FQTwklVB6eYJ1cnIdoHsiu6xgdfmWkgs9NwlxdvY8ED2bXlGIy/ryVbAq+4E
         4+2fwD2jZUxlxYHfX95dYGDfflQYYhorjGTqnAArd8nR1HnobhyQ4WFyZEdE+OdKfBVh
         WLpffFUVs+er7/qICPsX5zhAzvswdSsIA9YlKjZj6S+R1Fgo9Xt/vZ2bt3CDmLC+bD/+
         5ddAzdHCI/XSM6UYdX/sjgGoQuBJ6YI3Q6xzaZoldakOJzYNUh44VzeIxFO/K9SIDuH6
         BdZA==
X-Forwarded-Encrypted: i=1; AL+hErFMI90a0nJKNGfPmGkv46DHE9xYzqSURIuVZlzcvfgZoodLXBfrcWosUil9wNZmN5rySt8qlqYiPOy+Nqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/acvK7WrzJeaUkbGxuMXYxhDCEZ6Np9mwEs3670FgYhVFw7pQA
	MyZMAKorL2H6N4b0cpAxQBoLWGsu9FGl9vvCg8qqob0CxicVtkCGHBp9DbwPhY7Qbxo=
X-Gm-Gg: AZFdTZdT9mF5abw++yOV+2CFAy9+3eK0ohNPDyLS4v+hym4lW+9NT32SX0JoAtBzhee
	ruBBKwd975nEKzU8u4KxeyBwpiJ8VbtebeXMKD5awbLLAHgSDXJblCPr+ByYrucQsCjSOKcujKv
	vYLf75viEzj5xm2J7IJAQ3N/9OgazicOJaUfbL1WcM6xTYtHKrwVU+gtWyYnNIyndzrWQpFrshd
	BfsZWsnoKybPJF55Rs4rfcn42pnU2k/OBnyvOCpTjzE7tzoCuNQskVljguXSy5C/iTeEwQyGHn2
	GId8dQ0+28lt5B59pBOwhugpg6gq0Hw1rzLLnaC/cdhP2KaKbuiEXT0hi5p4inAxkybLyl444hG
	N5RSjAAdcdNtq+MNwAaPVIhm1PAl+N1OPZu2HMh7iXej2ylWS3w5HzAUTjZG1z1uXvr563J+CLb
	PfVAqE4FHg0cZhuWw5/92lswexcNp1VYQ5buYJuQtcljpLvpovzI/vbdunsHadY26rFTJaOOY6M
	uKqG6PNqFij+MHLJb9Knej2P87jg6e2BuBNHuEP2BnfWGuC7OTIdY3qxgbnzSA85H0BYmfHh73j
	lgG9iI4DW0fRfc+tqWCCvMwDQhJ1zhlnahomMRuoowy0Fw8GIKtxZsWP6QSX9RRbeLshS2fFjwL
	AQRr4Kox4jv1+POX5
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr223796715e9.10.1795434068387;
        Mon, 23 Nov 2026 03:41:08 -0800 (PST)
Received: from ?IPV6:2001:a61:131e:b901:6da9:459e:7c6c:e85e? ([2001:a61:131e:b901:6da9:459e:7c6c:e85e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm305870855e9.12.2026.11.23.03.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:41:08 -0800 (PST)
Message-ID: <cef781a8-45db-4540-981d-b38667dcfbb7@suse.com>
Date: Mon, 23 Nov 2026 12:41:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: uas: expose US_FL_NO_ATA_1X in sysfs as
 ata_passthrough_disabled
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261121155253.4980-1-mat.jonczyk@o2.pl>
 <68f6376d-a0cf-4f87-9cbb-0afb7b8536d4@suse.com>
 <52a233cb-1671-431c-8c14-7757ca947aa5@o2.pl>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <52a233cb-1671-431c-8c14-7757ca947aa5@o2.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23.11.26 11:48, Mateusz Jończyk wrote:
> W dniu 23.11.2026 o 09:27, Oliver Neukum pisze:

>  > thank you for handling this. One thing though. This requires putting
>  > the emit code into every driver. Can we centralize that somehow?
> 
> Not really, short of moving the handling of the ata_passthrough_disabled
> attribute into the middle SCSI layer (which would also likely involve
> moving the whole of US_FL_NO_ATA_1X logic from uas_queuecommand_lck()
> there). Is this what you mean?

Now that you mention it, shouldn't that be where it ought to be anyway?
Usually the SCSI layer generates or filters commands, while the LLDD
determine what command sets a device will accept and reports that.

	Regards
		Oliver


