Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709701;
	b=S0V3W4DrPgBlE45ocpYWQwEAWZ8IpvBIExnV8VaZXIR2aXA9Ek480SKs5/yLIJUFut4Q
	 heTH44KAgd/8jwordlSTWqVvFb24TRCBBZrYNTTQtL23oVsDdToQRcXA2gx/6WChvmKXV
	 /ZYPwcVU8g9IhUbxlEMmQOYTeFoP12HUyNtOFfnEp+nxa/wqI/gZosZyZiSwljvrklX08
	 R6VsAsA997ULA7SM+o1ykp3TPw8uy5O3eRjIVnE98LlirIhjA4FYGNRQ5XIGlE//sojq6
	 aWkakkeeSi3jTGqSBsz2J36+dZGg0pbLiQ00JTgvf0D9udukOfnJvgAJ6ZvG6b9c6+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709701;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qbs+BIoxoJt3KJCB4NUMQ6hrQHuhNkcUXUoL68Fd/0w=;
	b=xsxizX2oNPCXQqhzGQGdO/mnafzjWda2UO6it8SJvKvYO59BHlnlRwQhDRMBSWQzdzWT
	 6RP6oCtYijWGGhcAgMVlDiovksnQCC6qz9yWN/NNqYkk8zMboTDDO6SgNZrZGK1M6275l
	 bAmGZC9qiNOmWiYjWYcsNZV/x/LNz/5nRVvPPTJzdX7DxwlQju09R77t8WTz10TAk+JGb
	 uXE2DWHtCUdfeiVA2mn4Bi1HDY+QS8lFdn2E+NWQsxtf6T9sxIE7Dy1EBzcH3GLkFIS62
	 x5izoRS0VTYSw+cibSEtIzH27zfL1mHPcvJlCi15ovEKrs24EPo5Sfkc2I8cQmo02Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ct7OBTWa;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71232606A684
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71232606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ct7OBTWa
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4929202eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709698; x=1796314498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbs+BIoxoJt3KJCB4NUMQ6hrQHuhNkcUXUoL68Fd/0w=;
        b=DEOO04rLLZ9Lz6nUmrJ7ipQjw/i+IRZYPGxXGeGLc7dTzscPDPSaTdsMgjdJA284El
         ZnAOlLF9TZzIw3rhA+CaoJLu91rX6MXC4E6VUxh8iJvycI+qlvbUkyO60ZBnp2cGhF7e
         YUyc39fQRElQg+t1nRLQ0PCo/aGQzYS5gEf2uk6oVZSxhWYNHccWBNOPCEruIOlFjouQ
         GuGF/4xy0pcbDM/V7Ktsqq85RzX56MDyzPETFOdFYdugpciw7Y5egWg4EuTr1PdY4w9y
         oVdtJSP+qYVZ7rwUJ8ZMlZcW7fNwJO5d7gzKKrtzU8LQl7tYYLVBVvCUi0dNZDj+oa+/
         sVvA==
X-Forwarded-Encrypted: i=1; AL+hErHRc+60H+KDLdRJ0QikCJuS0i4gu2h+N0ma4kuufp3hY4TK/SG9scHyUWeTm2eGHWM7fNfOX877Bvg1Xto=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tzrDmgnyhhfnw/MHtt/EkrdEpmOm0TW+YFB8ziEy2EsDdxbdi
	HTdejQfneCfCbJkbASDiRJa4vhKLDY4wO5bNMzgGMj+m26oLGesbikE4d9ReLfdGG0OaCo2/b7s
	OgP8z/AtHwlzJHumWY+d7Nyi/lGxaVZVMi748LZUuJZIQ1mxyDEcgHpxE0UuVOCIuqhmzNvfhR4
	ozW3nO4FecdR6kZQKybi64avLmT5FIRYy45hInrQ0O0zphcD4qpgNw2FOio/gxVc/k+B2SZH1za
	XDssInSPuMay/6ydC8HojaO9A==
X-Gm-Gg: AZFdTZefXxzouHJqSOKE4oaguFNyNe/W58fswCtkPQGaGwTeSSXydsMMZZbpLUmc8+i
	/P9ESfx3ioeMXWy3YSuVSH+94NE8Z8adWfCU71tfx4cW5oLprMy7SxMRG5qGywspKsAxZXTqicO
	BRGNrsT9whaW8s1nhPJ+lYYSs+MiYBPn7w7hVQNSFpSC15Rx+V/WxZjwwq++RhL1ML5hCHCI/TF
	Fo6i4HioecF4qP972gFlwEXPEe0MxjnPvpVYxg42/4MlNzwe9FWKK1xmJPdBLjasHLcTgjADyBg
	5QBdPAlg2oLX19XYWz2dOzfUamwQEh5tYgTCgVpQm6GynvBYmpaLwrdTpysOSHpWiR8dxx4+740
	dU47DUWukoGn6gBVGPXggqpEBzrYJ3yfxXWQaEFTy5955oQCyfqH2NnFsKAqiXYMKL1uGl17fwK
	GshduYDE6MBHdg878xcmfSFJ3GauUB3vGKsq0jYyN4pQ==
X-Received: by 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr21000965eec.11.1795709697262;
        Thu, 26 Nov 2026 08:14:57 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38567da4fc9sm3288148eec.26.2026.11.26.08.14.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:57 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so1084406885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709695; x=1796314495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbs+BIoxoJt3KJCB4NUMQ6hrQHuhNkcUXUoL68Fd/0w=;
        b=Ct7OBTWaT70Hlcd8Xd6b+0r4nyZ+thEcLgNZGNuBoRF0vVY8wCVja1rJhnz5Z2sEw7
         rG6az3ZeY9CHZo9IwidVZS1dblSLiMM/Ko9dZ/VaZ1d6pO6DyRE6e5oGAJ4lgBuWok9u
         JcnrieyO/BegGKiKYMqG/jACVdusSzds7bxqg=
X-Forwarded-Encrypted: i=1; AL+hErGWAJUYCwQvRpn8sRU+JSeQ7wpRQ6XBdBaCLz9pdQZJY2DADOndEorsXks4KtnRBxu53xCQ140Z3Ij+MnI=@vger.kernel.org
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr3803211485a.40.1795709695450;
        Thu, 26 Nov 2026 08:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr3803205785a.40.1795709694974;
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 6/6] wifi: brcmfmac: pass AWDL frames and role changes to user space
Date: Thu, 26 Nov 2026 17:14:42 +0100
Message-ID: <20261126161444.2484980-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-7-dev@deq.rocks>
References: <20261125190254.176055-7-dev@deq.rocks>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 25 Nov 2026 20:02:54 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> User space runs the AWDL election and peer discovery from the AWDL
> action frames of other devices. The firmware reports them on the AWDL
> interface with ACTION_FRAME_RX and AWDL_EVENT, behind a header of
> version 1 (16 bytes) or 2 (24 bytes), and its AWDL role with AWDL_ROLE.
>
> AWDL_AW, AWDL_ROLE, AWDL_EVENT, AWDL_STATS and SDB_STATE are event codes
> of the Apple firmware. Add them as abstract event codes, mapped and
> registered by the WCC vendor module like the CYW module does for its
> events.
>
> Pass the AWDL action frames and role changes to user space as the
> vendor events AWDL_FRAME and AWDL_ROLE.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 110 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |   3 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |   8 +-
>  .../broadcom/brcm80211/brcmfmac/fweh.h        |   7 +-
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |   8 ++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  12 ++
>  .../broadcom/brcm80211/brcmfmac/wcc/core.c    |  39 +++++++
>  7 files changed, 177 insertions(+), 10 deletions(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
