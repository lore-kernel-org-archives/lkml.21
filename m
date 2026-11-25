Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630270;
	b=qmCuSE5iar+qEPYLBGmksyj3FU+c+vsuED7nWfkOou0qrxXK6BYHANHBRNTcWGv8/a3R
	 QuPXf5Xnh9rcbySabSQp3Ct/uaqODmtV6r0ZlNimPyhpCXMsViUTV08o2wWmmrZmd79Ne
	 maudtZGtym6FJI5LfW2Iym09+qa1Ejo8FW52g05E7mx2UEHiXox+vFGzgDVeQVmyD4IxO
	 ZKKkWEbtqFkACzvzoYMQZf609LbTxAjmdGk3CSYFI8SHhxXavLBw+hAq1XxniaEAbM006
	 Wc6GpJFIhNJMJKAkyU4lSYZoLt2CAnyckBjnBV9+HU2tTMH9masbjdnC24BvnNLcuvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bV56WuCqdxs/d/79ZdlE9Y5jpjOdMcPVYy0fTABj0Lw=;
	b=nc9auhgj8rMohW3T6m3cnnpCmu7lYa7QlW7no+Y409YlnFGZLmnZsq4n9VvlVnpFbvGV
	 zA4TCfy0xswW3Y/dV9W/iO0VwlSkDb265TY4WHpTVOa4XOhGov0di0aD6TbjVqCFIMg//
	 2+CgMPuC/uUHsxrOh9P3T1Rb1VgDU67mp6uZlgpgZkomRwpu0B+MHk97gVgOzMS0FHi2r
	 jkV2JkXQmdIGAkjS49wxShelzGaeDFot2yQl55jHMUf8iVtqmzR5EWyuu2y7arfGRxFCE
	 +usQRqnKEMx52Bs99ZtY+bUGmsUha/OQh8RvVdAepGwkjjPPPkbCskNHyI7PiysorTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JB+6cSqt;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF83B606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF83B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JB+6cSqt
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso7633130c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630269; x=1796235069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bV56WuCqdxs/d/79ZdlE9Y5jpjOdMcPVYy0fTABj0Lw=;
        b=JB+6cSqtrJ7NdNPYm7dhd/ymdEhEFOHZN/J+sqsuPD8YXcPI9tNxImftGOMcZNQ+fX
         WUyqqgy92aSEnJUgwypqoz/3CWO0Q2GgHVvxHo/6DEs8V6tLZP3ViTH37dPiq8c/NnyD
         Yssb5DzKLO6w0558NReh5/L9tx4QhcIxkNdzr479zllmz6SndcOX68skn2uT2fMBHCd9
         AoA5+o9OeIIXZR9slOE2EelhG6qgZ7wq+xfuGTuZ+C9vtyFbDoUHvBFOkbToeERhWC55
         oHXIHYv9DMGdCTW1D7ppLKSA9PpX8WGjL3ZKVIFcopNLlBtRVBoFdaz1d7D6KT+LoCPG
         kxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630269; x=1796235069;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bV56WuCqdxs/d/79ZdlE9Y5jpjOdMcPVYy0fTABj0Lw=;
        b=mRTKt4I8LUxymyjW8ffliAfWWJlYqrFoLCSJMeGe9WcexQVESnbncw8HU9+AtnCr0G
         Sxva94+eguxLfx5vzO3o+IA1UzI9f62lAyPEfzey5oQRLU83h1CZo3QEeXg903lgX8Q8
         9gqliFcHICst9+CvkuZxBIQ//p7aeDicxdXC9emvSTs1j41UKJe1dYHWUrVqbsEJ/uxO
         G9+kluivvddjVqoNxnzfwRKWEZyrRmmo/s+l9dpPKAcE8+njbYVfCHtuvYbO+dcCBoFo
         5Gz1TwnPDLY5Ezp10IehobwYh7kQLtRI7l/eVRFEV0/JN+VoKafdS1UEmX20HtPfTfU+
         acPA==
X-Forwarded-Encrypted: i=1; AL+hErFXnWVpKulP6k9/2eW2b7zGZpvR1QJsAjSFp8KUXra+vX8VgMf5ShswMj6zE7DlgQcyQ3io4OkO9sn9T78=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VHWnEtCYfJXwJ7uAfiZnwQs1OK6+NzhmSK1JmN894MYukxNQd
	qiKj2dOLP4g4hCCN1IjhmsIescu6y+1QH4J8u/+TSjUUNQTsMDqnvQIZ
X-Gm-Gg: AZFdTZe/iaMu2xOOWMKi7B/1aP2MNNljPpU7xhFAWEPSe1B5QtSTDOPt+Mic1v2j5FB
	7j3aMRbNPrppAiXzXNluMoUAHtOQgJQWBIbHIolENTNoCOZodSf//2C2HEwtIuG4wSIPjBVm0D5
	hAHPouop/jpXeRDHtHxjJ96hPrte/9O/L/spw9OSClXr9cpCrTiB8j4cP8iwDeAvEbgB7p2xN9V
	j5q3+L9agvfIVyVFu/mUhLlXfDKDEfCLhgedSg01IMKvFmnD3UGqFolDMc/WUt4KwCQ1mh2Fozf
	4zBH3Yrl1DQ17iadS+dWTBRfBD8GPuRU4pBVSGPPYmB/29QpDvC99vrk+FAl0Mv3il5eB0edGeC
	JR+kUy/99yGFpCwpZs22zs6X0RUiZjuEArPEJQwHLFjAewBZJMVzzVfHQstpCkx+4RoDkaUkwWF
	wpBIaIBglyFhBjFRDAMIeaZn0qUcuISx3k/ttfkowoXrV+AKCLEqFDV4uNl6eHhHVD4ZkdETBJL
	t9OMoL0WReJQIFKzcyqPdgRketQrVWqSET8ZfD1C7qe+MIWRHhF9L/FQp4S/mkXZRjtziu4wnyC
	fREsqrQArhpRDUAj4KL7SJRRu4OA/FnEJGuxAg==
X-Received: by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3856e63b064mr20473117eec.11.1795630268730;
        Wed, 25 Nov 2026 10:11:08 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8549:f8b6:d936:b4fc:15f9:5ee6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm66440899eec.10.2026.11.25.10.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:11:07 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: gregkh@linuxfoundation.org,
	aiyengar1990@gmail.com,
	mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: tell xHCI that it lost its state when the core is powered off
Date: Thu, 26 Nov 2026 03:11:03 +0900
Message-ID: <20261125181103.830-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <rtgfuz44sjpiomzhamrkvteqygkk6jdzrvxh4nfcpabiae6bsy@cbtvblfx5uao>
References: <20261112141512.1840-1-26rote@gmail.com> <awZHwRiICsPs-UyI@vbox> <rtgfuz44sjpiomzhamrkvteqygkk6jdzrvxh4nfcpabiae6bsy@cbtvblfx5uao>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2026 at 12:44:05PM +0800, Xu Yang wrote:
> On Wed, Nov 25, 2026 at 02:37:38AM +0000, Thinh Nguyen wrote:
> > Can we also Cc stable?

Yes. I'll send a v3 with Cc: stable, limited to 6.15.x and later since
xhci-plat got power_lost in 6.15, and with the Acked-by and Tested-by
tags.

> > Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Thank you, Thinh.

> > This may conflict with your "usb: dwc3: wait for the port to leave
> > RxDetect before xHCI reset" patch. Can you check if rebasing on this
> > patch work for you?
>
> OK, I can rework a new patch based on this one later.
> Maybe I should wait for it to land first?

Either order is fine with me.

Thanks,
Joonhoe
