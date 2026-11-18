Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019986;
	b=x/P7lSXsb1YQh/t5lmmyhtbSjk+TwOK+983trt5Gns/YtQ1SWiHmp+IWnU/dHdsJCwN5
	 1XdIVRK2ZLtrqLdD/ok4/2uZxxblnjXI2otdjgAWuw2KuOlOciO/l4Ln0yzxhHPreojcs
	 dZSmTE910jA17bsowaghS9sQEy1b4M7sF0BhCNjAexjfT1WD1U4mmxnA9inDsru+wmXJn
	 Glczs0qsqkkPp6bcmsWy0J0JMVGtNGoIRbYtPaF2RiWIygtJg65thVplCtsomVaTsY0JX
	 GeRMcxvqE/xRAXYWw97btwQt+HBDGMocJu5zUyGDGdQbDHc3DU8CekeCrmUQ0pSyOiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bh8psZOmC4bOFeg8VRYosIGA8CEyLOtfgzV/XgfIDhQ=;
	b=MOnub1apIOERuf/FyQ5RAVR0Hm3eJDqNjiBZ7VlcULFAKUigpLZ8qwj1HwhvjaH3gOqa
	 SMpFnSDypLSpED/DO1dJu+38IDnyvIvivKcXFhYb/TWhcNuGtsSc3hI2wEdWM1Xoj9AIg
	 BdoazweAWLkrJSO2E2oqBHq6P5qrs3LFrZUTS/oeEUmUIVYPjnOR9A/xV2EMn0fyKVcCy
	 ZfiOS4HMIIm3vyMSUEuH3s4j6hW1k7ukgExU48UQH/UQxv13wvjIMzrmJzWilsaBs2+14
	 BTnGPrSzBofWG00vbvXc74ZDeG393HEQ1+25xWaOReCRikAeEcqil+0M32x+f18nzbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1GXwBK+;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41468606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41468606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1GXwBK+
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380b40312e2so3379158eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795019985; x=1795624785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bh8psZOmC4bOFeg8VRYosIGA8CEyLOtfgzV/XgfIDhQ=;
        b=u1GXwBK+2acPTtV3x6/dWKjQkAEYAj1fKtbbBZ8NUywmLbBY7ZZWJKYNrC1R41exYM
         awNcOavT/cIbWqZIJ76ueUn7gOufU8nBekNpWjoIlDKKL0rtww7CUEapAMvFsS8Bx3nr
         zebHWBxsta1UOuQoPtDfNN4lBZ3vFVHCRZ4FNTqzTKGkkJGQEGuiNBxdGOgVSDSOZzf0
         EhcySgEdLqdzX2BSwjG3WCcCqOSgwlZUGSzO4q6FjuF3WjmfSPiUGWa3g4KRdmQEPHO7
         SUSOhwfABG3uyCNDLwacpcnEZzdi9DLlfTJsVGipDvJyyKYxXZ9yLPyS0nXNdPGPtyPR
         fmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019985; x=1795624785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bh8psZOmC4bOFeg8VRYosIGA8CEyLOtfgzV/XgfIDhQ=;
        b=g0vn+YOs4Si+FlaxxR7wbRKnZl6XuDztOFjA34aXSirnt/bc65FOIZL1tCXAOEbqQE
         yxDkfT7KMVNLA0AOfUeBqQO62dR0RbxkKF8R3xBMsVGOK9vV8000aSeIx9fMFvocVlf0
         jmU0T7TJQb5hjfGEoeOwEROe0KIFI6gehfhWfMjDy0BpGNBwCpRXx96qwRUEX7ET2p48
         u3prArf7bknGRNNecKIxmPLEBH0KAIvl27TlHbWdPPEvbugZTrLPNWZAoRh5nQ8WpGNa
         53zsjwOP9jt7V2+FakPwx3Axa5Ub5OJpBYiE/eEkkWRfrvkOc1M5WvtBT8mxCssYOm3u
         K4uA==
X-Forwarded-Encrypted: i=1; AL+hErGsJdnn9LcTfA576doLW4AcQ1iIIVIvOOvYK1V5HbToAgGOkud5avki4adMJlEwWNqHB7P8m0W8XIwo9AY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XmUAXwb7Y5UZ8i8AgpY3nLK/MJCba+3gPDLLst/CkthVFzHRO
	l2s5XxsSzJ3ebMhQVWWUPcfvPpo6cAHWDjqVNy5fYSVyaJXL7q8KjU6V
X-Gm-Gg: AZFdTZdMCEYHhMGeQa6pvXurDpjVksLJtgfpmHcB9DeILLK/+IcB8SKNrqEUas4SZxK
	gux5nyF7AcoFtWcM56b0baIg0boNv9SfVL/Yi7+GvbZhR3VyYQrGP+WMXEfiMPkwVj/ppcZG5h8
	QYRLPtqzD7krUZ8Heh55AamYW9Gw3BKsiqe6HoHehoImyFiKLf5Bn8kncClexydt4fWuMU6aN1H
	KDtNwn6jD3OO76SmSbTtTCkCoh8LqLywAd4pXatrZJXluw1fJtOy1i8BQkedWGqzxX3IT0IQMCs
	mQ1C30E+saG0v3spjC8Fx8lOlabxnszXwnZ/L3+K0qu29p82AebSL2rE3fOkUo42+T8OBucvKyT
	xDn89JHe+aqPTp49Eev56lbcfOok2Nuse5k+1Uqkgscb9ItEGUq+zb2bbVpASGRtV84qviRSAuj
	C57nZ8PR1i0v4XXk68tQ+OnM4rdG4ezvc0SpJ92YnRr5agcM0nsGsWJ/7zNBpPsNeyWn5omDvWi
	pA1KyivV7pa1lrSl723pbGdKQ0UK7OfaMjVihdIrgh4gJT3laRsGMcivjWPqurdhDObOECZQxou
	tn3F3KuAcVsDByklCCHcp1ZAM1+lN5SoV0XkKsKf6Gzgen17kWtl
X-Received: by 2002:a05:7300:6da2:b0:380:d99d:ce1d with SMTP id 5a478bee46e88-3828016fed0mr4014426eec.15.1795019985119;
        Wed, 18 Nov 2026 08:39:45 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6df02adsm10232008eec.14.2026.11.18.08.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:39:44 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhelgaas@google.com
Subject: Re: [PATCH 3/4] PCI/AER: Report the ratelimit interval in milliseconds
Date: Thu, 19 Nov 2026 01:39:32 +0900
Message-ID: <20261118163934.96979-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110215614.3931232-4-yazen.ghannam@amd.com>
References: <20261110215614.3931232-1-yazen.ghannam@amd.com> <20261110215614.3931232-4-yazen.ghannam@amd.com>
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

On Tue, Nov 10, 2026 at 03:56:13PM -0600, Yazen Ghannam wrote:
> The "*_ratelimit_interval_ms" attributes convert milliseconds to jiffies
> when storing. But they don't convert jiffies to milliseconds when
> showing. So the user is presented with the raw jiffies value.
>
> Do the jiffies to milliseconds conversion when showing the value.
>
> Fixes: b4fe7398def6 ("PCI/AER: Add sysfs attributes for log ratelimits")
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  drivers/pci/pcie/aer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 401cd3a1b3d0..32a4c9101946 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -699,9 +699,9 @@ const struct attribute_group aer_stats_attr_group = {
>  					 char *buf)			\
>  	{								\
>  		struct pci_dev *pdev = to_pci_dev(dev);			\
> +		unsigned long iv = pdev->aer_info->ratelimit.interval;	\
>  									\
> -		return sysfs_emit(buf, "%d\n",				\
> -				  pdev->aer_info->ratelimit.interval);	\
> +		return sysfs_emit(buf, "%u\n", jiffies_to_msecs(iv));	\
>  	}								\
>  									\
>  	static ssize_t							\

I found a similar issue in other subsystems, and this looks good to me.

Reviewed-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Best Regards,
Sang-Heon Jeon
