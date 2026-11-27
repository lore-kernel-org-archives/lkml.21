Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788819;
	b=sXhtnZJJg+kOuS4GKFO+KUUSpTC8B5Eb4OjUl0M7h42pGB+2V4HpYgPq3MB7dMSke6+1
	 RVmYPk/csbSQMpFdWz8FhazS87ukhj7ev5OzmZImSm4EKTv7y2TJRK2SGgmjoxZWpjx1x
	 xGq2xCbvIEHy9ddTJGgWjYKt51Z2njUPlQ8JY5Bh0Q4EzfjyLWVGFAhgGALpK1J9+wOHj
	 RXSkiyesLIfi1S7fVqnemqOcDTWZsptik6/pDLDyKtHdCZ8rpULDLVpug1XllerQ84Qxp
	 kOdS6A3+nd7JwPzRYFZP+VkCrLmludNpAGfZ3iOIBH1KEqWKnlCPJuO7gNvoAUsXB4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W/we9OmzIGIx+Haa47I705VpYoEnqSWLQ8xu/l4CLfc=;
	b=PllocNOucSn0IteySkBLZNlM+NDxs1qVrHiCpPCc1t/QxroFZ281DCene/+UfHij5FMT
	 7v8R269VHdIHNJfjARPLbVaKU1Kht7nzmVeMrwPbksZDyixw8xQb6InImw4FL7DmCvCRb
	 ZAXRKr0lLeDARKW85V+gNJ0ZRmdGwI9GCuwdw/Uu4oRlpZzU0oIdD1+/fY6RYu5BB8HlJ
	 a1r8dainhD4g7GKmIJE40gQ81qVVKNWhO+zIamJYt1LC/YAZ4ZoP9xqS2L6YR4vPNSMJh
	 IqoYlmkmWq4/+B11fpuYqMkdwVI9omN3vWqylPAb5nFHGonIEUg1VGLS1psv6M7uXZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLRNMgag;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7316A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7316A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLRNMgag
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so7654549f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795788818; x=1796393618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/we9OmzIGIx+Haa47I705VpYoEnqSWLQ8xu/l4CLfc=;
        b=nLRNMgagNLC1V6obaF3TEgSz41fPSaNzm4EtXlnUIOoRCal7yVxImW+vjmBfE9ferI
         vOOCF+q+IovrLjgavyAU23tdgnpOpofDh9cNxXH1F1rwdalZ4EYPU4LRbGY1CvYhVPfp
         gR8GmHUOfVb3aiQIYoDr6X4LRSRi+XcaZql59Yyw9AZz19ZVvnSiCxM3WD7inVB9SjQv
         4ODIkHrBnKhzJ/iiyeGNYj8Q/gFDxN2+1FHavAR7BYs5Uz/+PQVX8Y4KAlg6DGqvxubl
         48fc5wCsVPVQLph7RQUUchmMAB1M6cGHnGe5cZyKRMf9oC4xnGpAI7HrdhfC4f9HvAiR
         xgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788818; x=1796393618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/we9OmzIGIx+Haa47I705VpYoEnqSWLQ8xu/l4CLfc=;
        b=oCw5B22bBQEGa7clI5unujfZ9nE6HY2cSN0r5ZIy54httZ0W/4ce1q39PSwkuySFcX
         /VV3g74irDIPskuk+W92+m3JCJe8EBMCRlnmuFaop9ufOyyJN9h6uhi8I4VF4LAS8Zj0
         6zdyr8JqmpeP2twteDYicIOz2CfEAdsacjxvJCzP6PE4OnpfPglSi/Dm5BHsrZXUeo7P
         zJHabM/hql70jt5YeIiUF5BVpAAd87sQ2tBmp/ZwCVKP6mymZDcGPR0RuF2+hGXO+C7D
         DThDeWCcZZFVsBX+WIekEaypA4wGoC/lRDCb27QJ0mZndPW8XzBGPdCJ4IS8BdUg0pKp
         gDkw==
X-Forwarded-Encrypted: i=1; AL+hErGVVgCKvGco5ie9Cv3xA15P3qD0/OKuaurPOvxngUj+N93FirDWe37qKKFQUVw42ocNnLcCgmep/Rwz5Nk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1V8CDeUgMajND+4LjNwdiSEWiZwUSzf6VI3lCRFSlhsQcnk8O
	dIYWfCgRKgOivqzVVKogwapRJsp+cRpywv/3Z9nLojoxBp4ULkUpAqQcCd5P+9R5
X-Gm-Gg: AZFdTZc1OJJcxXfg/c3nj2IMWum+mZty1ElWMV1jrJaQ6FE659H0V4c2xBtMLzpgUmo
	svdx+0d8uU02thsro/qC9DA6pFtXqlnZIgyLdfVPBNkWjVMR9W8P4lQ9fkQSBzV2ukR3KKNTeYD
	PQPX05UI15QLv4Zi3/gIS0WcuCnWtB1yWlBgwTH9zXqqdNzJGYYZ/7pQNomjfpR1jdD4tjbOpTT
	KmIg0XZkr1I5YL/baNjDTbqGN5rD+M4GV7de6Ocu8YoDddd3YIQfLhnnQQH0pa9RzXFPT0VhKby
	c46zD4XFnwm/dT6gXPxo7pE9PjkhfSgpcoILkU2otfCMOHTy0CYQ8uta0VI6OCU5arB3uSw/j+m
	xGrFChOYj9fZ2nWU6n4gpszAKCSvWHL61UvnueYle4DcmLNGlwssR3GHS+iDnhzhOVFevcrfDi3
	Hyiosa2kqFOWLkCobrZMifVPX+WkPSBFJilpzy0crFxHs7v9HTaNjy6MmMgp/e8GtluUh+Ea9H7
	ptse3L122fu09za3Q3MFIojYAvC/eGJorqNr/ziX/bezs3uoBCfo0jhg8LqShOZVNTyST8241Mb
	fV6BV433yWHALTIFjguGRWtwsGaQUNNwtDE=
X-Received: by 2002:a05:6000:4b03:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4abb2ce4d3dmr48840653f8f.23.1795788817479;
        Fri, 27 Nov 2026 06:13:37 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45883904f8f.7.2026.11.27.06.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:13:36 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v4 4/4] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Fri, 27 Nov 2026 15:13:35 +0100
Message-ID: <20261127141335.1871993-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <948fc37394234af580787acbb1686ee0@realtek.com>
References: 
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

Hi Ping-Ke,

> Why did you choose this commit as Fixes? Does it should be
>
> 5c831644e1f4 ("rtw88: handle and recover when firmware crash")

5c831644e1f4 added the atomic iteration, but rtw_sta_remove() did not
sleep then: it released the macid, cleaned up the TX queues under a
spinlock and freed the mask. bcafcb959a57 added the cancel_work_sync()
of the rate work to rtw_sta_remove(), and from then on the recovery
sleeps under RCU. So I took bcafcb959a57, but please change it when
applying if you prefer 5c831644e1f4.

Mehmet
