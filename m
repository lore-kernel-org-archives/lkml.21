Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477577;
	b=Dv/kutt/VkrJGWwnFHTJwrVMaI/EhCKZRqy/lDG1OpFQ3lrmcOOA9ewsypsNKek7E2jb
	 hm8ZpjNFkAxyhcddPPtPGUEHoEck4F2+q4Q2mFLwtnJ3Bk3ExQgMKgSRN4S5xp/5jwZKb
	 gN5xWKnpI2OTLMlykrFBjzOcpacowHHQa8OULkvYyWHfPXAHQ97uvVoYWXZ2QPZq/i9m6
	 e+AUkMJ6W0oXH2fP+qZy0XA7PcY1DcVF5DRigLCjBzNRbQV45CP1fIGj1517ZniUm2Pot
	 qQLmbM7AHQr5tU8E9FjgLwpNFpZ98OfK5/Wuh20+X1u/0dKcCPyDvZiyDUvRMSxRxbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477577;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=mXSdsw657OP2dZH5liKwWTWL1rwQsj8aUmEZ44q6BzI=;
	b=YSIZut2zG91VFnqW/C5H4bFQavho46OFpJGUH1i/h1lbFrh3EteEOK4Y9OJaeaMeGzy4
	 gVqfq0tJ1PAn0A8qnFPG3wkdE12LljLRMMMc+D3JwAPO2iTfsEmJKr7p2xRQH32pAvZRD
	 h1mFG/NJTsOPX8RWpqTtMWOgjtV8agDAadJsrSeZAtyZpkW05I1Cw69xqIthSkg8xqMCS
	 WzJqoA6BsCl8ZL05SMhsBwQYJqZe+v8j/rpohei6+vdAWMU98kxd+y7vhZDzFvGegGFym
	 iwnB7LluvIlot6ntAEBlenwgvYTM6g2OzXAAdYk8km8V7ZnIaqJvfuOG3JssUa6uxkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aXbw66MA;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CBC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CBC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aXbw66MA
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso2257989a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477575; x=1796082375;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXSdsw657OP2dZH5liKwWTWL1rwQsj8aUmEZ44q6BzI=;
        b=Ry6CdrKWQTZ65hDO3UA8KM5Q8k5v3FMiMysGTSeMLDIwjmMBKoQQLyuCrbhyLScp7e
         hANFSFaDhwxG26ZGGYbyGsW0CjsAV3VQLs3QQyDJUSzI6iuMZPTQSsX83/yuuEFfbjAq
         xfdHfoE5TDPkXtwy2d7mxFOPxtKtdRd2VyAoDkZ9cBZZ+U768KlTQyHSsSf8HDL5KGAv
         wAQ2tafmjQNXwFmVXqu7EfEuqHVPXJfOxvXoUISL85ohf72OnTlhjfV+aU7tSu8AIZMF
         3t2w53JviaC4IykLbb9U895cmgzv2D6LfFCgq00+H0+3r7UGqXNHUDK1kwZIXpyuAQnn
         IqXQ==
X-Forwarded-Encrypted: i=1; AL+hErGhla2RnQi5XL39mAEvKAoohnfRQx9e6QoVZtMn1iKMZ66bkaT8Dlv8ZZKZfs7l+5lnh36bIacv1+ueR4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nbC30BVM+5YN0P7Z5btLtCgq4e6bx9caeeL4ds9nmB9KBadNT
	U0gZEx5L1AUw3dmUePa9PXM3Cqhp7lqu7sQSrUA1L32daa3p+yFlxnPM9HI5e7U3Gt7HXM5KnwT
	OzgEorO9iqtfRnGYUETSrkwOPn2jPCvgbfZ4K89OHih5bXaQY9Ftd1vqAGwgTQIa0B5xtTV2KEi
	BkEdG/VHHhp/KTk0exivVqRDw3B768d5n1v0EboY7JB0QWYUzXnegqFBRnaY2AwjmFHAIfeDv//
	K/EzttKLSnDAxLrisxugJ1M4dqB
X-Gm-Gg: AZFdTZffppE5CxzwLt96Wo0SRbhzk/135NpB7/eQkKaBCBxrqGtWivaoSA86XwU2LyE
	qpKSApimfX5bYMYDSzKqTvEX5XjdVoLbef+oVPKZKghkeHI73bJdUVzp+A+COLW7m8jca1wsSJ0
	/XboBrvPs19uFpIFnDbXm95B8N59IExaONWVHAgkT4z8ibZal93CSXq0iIKJYPJeSg5SuHlq1R9
	Z94nqxiwayhHVXMAjLZ3o7b7IsyfLNn6agQ+GMKanb3WHfbbF9WGAFrG73sys4vxzWdXWbfSoCY
	H6bhH59b79UZ98aNuOOOV4picnovaHMXfttJYLd/xNTTtQGhKEGhOMkMhj6qy1nP6OJ4tjn9v8v
	sds8theug98Tv7E8Dd2Fb/UAFUPvyOZpE8KiKtWWVTShjPIEGiWa4t/QNwr6rw0owzSQoRGVpjm
	TpNeTXj31D/vSpv9/ccfuNMF3JD77bBhERx0Sz0A/0llosOc0=
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b41c92ce58mr11620331a91.25.1795477574973;
        Mon, 23 Nov 2026 15:46:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b405960cd1sm10177556a91.2.2026.11.23.15.46.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 15:46:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806756ea40so2480299241.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795477574; x=1796082374; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mXSdsw657OP2dZH5liKwWTWL1rwQsj8aUmEZ44q6BzI=;
        b=aXbw66MAeB4ekwm2NB7Bj+FQYqnePJgg2Xrw8cLZ14I7VAcWJ2ELBwpoJ3P20EWH9+
         PSTzvvKoE94oACb7lBMJ5j2F/QtgdpBD/YRNELmIF69R1uvHvRYxzUeNTLQtVXDL3em4
         2VSkVTXDmwKN8+HlX/hiEvZezeLMuiZPJUpjM=
X-Forwarded-Encrypted: i=1; AL+hErG9U2ItwjQDMITvfpLELw29u8pkWLTan9AYyxunt09QfyKZQQQ5v3nsymoht5/Cn47a6XVhdV0CIBKAQ68=@vger.kernel.org
X-Received: by 2002:a05:6102:1610:b0:7d2:8dd0:2eb with SMTP id ada2fe7eead31-7d7393ff1d8mr5969335137.8.1795477574050;
        Mon, 23 Nov 2026 15:46:14 -0800 (PST)
X-Received: by 2002:a05:6102:1610:b0:7d2:8dd0:2eb with SMTP id
 ada2fe7eead31-7d7393ff1d8mr5969322137.8.1795477573649; Mon, 23 Nov 2026
 15:46:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-b4-balloon_nr_pages-v1-0-d8944b587819@kernel.org> <20261120-b4-balloon_nr_pages-v1-2-d8944b587819@kernel.org>
In-Reply-To: <20261120-b4-balloon_nr_pages-v1-2-d8944b587819@kernel.org>
From: Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
Date: Mon, 23 Nov 2026 15:45:47 -0800
X-Gm-Features: Aa3M54o9To1m2Mt4frhSqoy_chjBpgWQHpG9-FBy-A8uiNdhJvZ87Cw0sfMLCGk
Message-ID: <CACKNADXLUOdqtJLWdqy1OPEeEmj+XnPk8usqRHcssOYjt+8yeg@mail.gmail.com>
Subject: Re: [PATCH 2/2] vmw_balloon: account 2 MiB pages in NR_BALLOON_PAGES
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nico Pache <nico.pache@linux.dev>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, linux-mm@kvack.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000000467800660fa33ef"

--0000000000000467800660fa33ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:34=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> vmw_balloon keeps 2 MiB balloon-inflated pages on its own list, not
> using balloon core that takes otherwise care of updating NR_BALLOON_PAGES
> for base pages.
>
> So far we didn't account 2 MiB pages under the "Balloon" counters, so
> /proc/meminfo etc. would not reflect them.
>
> Fix it by updating NR_BALLOON_PAGES when enqueuing and dequeuing for
> these pages manually.
>
> This has low urgency.
>
> Fixes: 4d689474e1b2 ("balloon_compaction: update the NR_BALLOON_PAGES sta=
te")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  drivers/misc/vmw_balloon.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Jerrin Shaji George <jerrin.shaji-george@broadcom.com>

--0000000000000467800660fa33ef
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGczCCBFug
AwIBAgIMP8k3oYr9dy0fawOFMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MTEyODA2NDc1N1oXDTI2MTEyOTA2NDc1N1owgbcxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjEcMBoGA1UEAxMTSmVycmluIFNoYWppIEdlb3Jn
ZTEvMC0GCSqGSIb3DQEJARYgamVycmluLnNoYWppLWdlb3JnZUBicm9hZGNvbS5jb20wggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC97H4mZ7IND/iMuoaowZaUcFWQmAEUROR90vJqkzU3
4ljaKHGMed2anb74NFJ+ij38btvWCdWlqUCs4umStciFyeOshWgBWlZO3bpE9BkonLzG9DGwSz5v
Ve2coDRxUIjXbcXgys1z+HiIaZVEBEtpGgBz/Y6KeJr6HHOLq3+1VA6HZ887DMaJ0BygdtOm/g/o
6d185nbusa6X1Si3WqQQEGq9/dHdVg/ScOBl4Hu/sEyY5dYEtIS6+wJOfeWq7PnJwK/ebKrmDXRl
CPyPFwCghdN64vwTIJ+z21krDj9mv3w4e/ow2NiOI82oVpFYCmR7NQAYn+zR+9ZMebTTtUR/AgMB
AAGjggHhMIIB3TAOBgNVHQ8BAf8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAC
hjpodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMu
Y3J0MDkGCCsGAQUFBzABhi1odHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVj
YTIwMjMwZQYDVR0gBF4wXDAJBgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQw
MgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1Ud
EwQCMAAwQQYDVR0fBDowODA2oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2
c21pbWVjYTIwMjMuY3JsMCsGA1UdEQQkMCKBIGplcnJpbi5zaGFqaS1nZW9yZ2VAYnJvYWRjb20u
Y29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCS
MB0GA1UdDgQWBBRPHRKFeJNRjFAKjHRo2iVVbhmbHzANBgkqhkiG9w0BAQsFAAOCAgEAZ1qrS6Fb
dv9hzcer2Yv+uU29P/iOOBMMIkRHYE2il+wClTPJMmcqRAmTu8S2az2h8XpMkKoWDTHwcj2KUfaQ
UlkMc5m9wMxAVDrklB1uE25jWKnE2X3NQn62oxIMbATya2F6ev8p59kLh2xo0GVxotVnapnbuAaH
2D6xevthNq3e2akPKltISCI38CVOcC7rWuBZrLgdR8dEDLyZW6UMPwJLk7v4ZPyn8E5pMKc0fI5V
ZaWzs68PnkVmKNbpx1cECaQjsrBrXo/HNOQ/DGhHXNIF2k71laGetuCwhewrSdiLQZ3g+oAAvfKU
/FZV1kxiUVet5SmPA02BCW5yz80uHPemLT8KW8un9H15UXd+axLYqKEgr0nzl9stxbsC3vC4pbXQ
688Xqj7ZDCj3LGVbFWcdQ6bPAcxDwLm2z6A7PJdV4xDPTYhsK4io5/ZfaHOC8DqKT3klVZIo+Heg
5NMaydZ2ZiuKonE1AwMVn0KLV7r+vs/l8mIxwHLrNuWu501u2FYtMLcau6ZT0KbjwCKmMVqpvqMk
Wybe9jF+aZWzjNutxjSJGP5oSmrUpNP3UzAio93FKeLiweQ6L7E6GTBIrWNKHEog46OpVY865QPD
v1r5jLUYELDXa/NsznnUxWljMsYK9Qa4a9MUkQn+FF0b1xE5XuFm3mncJgGAsbZeN8kxggJXMIIC
UwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQD
Ex9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgw/yTehiv13LR9rA4UwDQYJYIZIAWUD
BAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIHHwhlLmK+lPSjnvL0KJHTVkI4kBzkdH2IHR6pHEdN9L
MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MTEyMzIzNDYxNFow
XAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAK
BggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJXc
BfmrWXFo69xOCkcKAonrEpIu5YNuIdsEaxRC5r7BR21kWFGz6i7JUyYx5bfAjtjl8OfdVzh9kxMH
kBw2aGvpq2DZgbbXRDf1A2JoH07VhvbtaWnsCxpoM9vGreNMdwJZQvgieBUAfrFjwVH5XrFkK3UZ
UXn8TNNq/xPBDvrNRVUvq44ZS5LDXikxAs5LZwtb9Pyo2vve6N0Glo+UuPlH46UaFKTXxQ/m8XWP
Hyi4L0pE3AfjHT1r6uA++/IjuklgTR8WwKFp40O7USavYut9YyFI/DKwdFMTaHIPAMgtq8GCCM+v
+lRG/dDMsLbHxK8FR1f9/VzdsLRaGZoIkUs=
--0000000000000467800660fa33ef--
