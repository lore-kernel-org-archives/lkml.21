Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551461;
	b=SwPhS1iwOIEYBeyMre231ftN+sgErQVP9tCHwavZjRD1h50r3HxrYJrU77GBCJiaXRJ6
	 Jrg30q77d7FX9aFgqYB3C3ElCkrVtg7bDpiHIjZIk0HGFj4h/1T3J1vAY16ctNZUekDnG
	 uPWbZKckuqjMPpm8SH6kOMsZ6q4q9TUNTeD0nPAVAr44saJk/0FnVg7pvF3oo+riweNP3
	 BufNbuE1zuI42b+ezTRhTW3ktXlosoxT4Dnq8tiwaq/+SRPdY0TKBP//+yulfI8TGb69k
	 URsDhrbarxGKri7tBTL87loGvpdBCDan5ls7IopxKyw1ARmUGmd8LXM26Txv2ubuuTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7tEIWHNr59KovVpk7gJw0JqnDAdNK2se9vPrBzQVaug=;
	b=o4v3P+n0Bskb+0uG7o8khIxkliQVRCa+HbCpETEocKR2os5hc3eTRjajViU66XY6i79A
	 Pq1u5hWtM4Hqtmb7FRw28cRr3MeCkUoVtVmWc7DHfTX2vK8jtxm8ECQF26O+OYty1wgj8
	 Fol6bru3cCZR2oHfiSpmU+RsA0DgKR0YpolrREama9bKtp2+y+6q1ksJRIXSKepT+bQgt
	 EwwRyIpDfwVmS3PJGOi+4lwY1vaHX58zVDyaRbsefbqq9857ftpw/wOUTL8te9pZHYX3T
	 oNoZXKGFjzxqA9TjVEcRhNBZrGp5k72mcl9WeKhDLfwTxVp5TyPmRFeXxvhRDhoIv9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nb2pv8VD;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0753606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0753606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nb2pv8VD
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so4462883eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795551460; x=1796156260; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tEIWHNr59KovVpk7gJw0JqnDAdNK2se9vPrBzQVaug=;
        b=nb2pv8VDMR/0XDeskST2FUtXZhaXaTz6VBDhVSf8jygStpkJ3cnOAMj7Gs67q163AV
         HRgJdegg8TDsLIhudxJXdJllEjVFfK8qjPl5iQS7ttQJjzmZRQNLIufeSg+1SVVGoraE
         zEAw9HDigrqDdqzHWHeEEOrPov3ipXQf4hPCethwDGUGzBmdfxGMNVEJjmOpqocy9M2Q
         xdpmDoxnLOh0lam003V5Gp2r/03bxUOu9ORIGPTGipo8RaxMTma4KxqI7xP78vEC20HT
         KAaCtvcyAWFrrQE0YyBViAWKA0aR8gYxmzHgmj3KhLYUhWNrbGBAXo3kY5vsxUqefhdO
         OLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551460; x=1796156260;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tEIWHNr59KovVpk7gJw0JqnDAdNK2se9vPrBzQVaug=;
        b=HUBnxsSgdCbnEbp3LgvFTkBdh2hnCgjngrENkyOCJY7Wvuu2o5FFK/gtwyrD837Ynf
         /ylpVxM4ZSGk4Y3KVqaPKyPLTmCpp0C+kniY2jdeOHp4/Ypzt+6WdSba0+D+UpHZGtra
         UYNZuVpqdcLy6hex3OzYUQTJc5BwzhiCEm5ch7YuT8PhPb9L1nbSA4/quBqjE67hcQTs
         +HpY8qz0Gs5cJbbYwJC6CY1RC3SU1YktO1JxJnBkj0wsp7eOusoWyZs+LbJ4LrAt2/h+
         RlE6f68Z30A4P1jkIFFxrB56Qk0K18VOyoWgrbOiD9TQrZGVFvyFLRDzIM+kqndjohUe
         uTVQ==
X-Forwarded-Encrypted: i=1; AL+hErGv5uK7W3e24T0Fc0QqJ34bfSN5FpWgzN13F8BwbX7ry/QQA0DbE2aMEL0+GipE+VxeuD8q4NzJXY2X8rY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/egHnRvIQSz/GZ1768K1LP8Eg8cjdKmSlrzhF2BXbOU4OsuhyV
	xa1KdAXHPk11j0CAnMmC2w6ghS1cPwhCMLHaQtdlo685u6b3AHLvUvEiGFuMGTe67clpY+JllNu
	NWalPDIGrRA==
X-Received: from dyblz33.prod.google.com ([2002:a05:7301:1621:b0:34c:9660:9612])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2
 with SMTP id 5a478bee46e88-3856e63b064mr17431781eec.11.1795551459435; Tue, 24
 Nov 2026 12:17:39 -0800 (PST)
Date: Tue, 24 Nov 2026 20:17:35 +0000
In-Reply-To: <2d518dd7b8f7be147b9a957ad94f6c6641e4b5ef.1795089715.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <2d518dd7b8f7be147b9a957ad94f6c6641e4b5ef.1795089715.git.mst@redhat.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261124201735.1311047-1-pratmal@google.com>
Subject: Re: [PATCH v11 7/7] mm: page_reporting: add flush parameter with page budget
From: Pratyush Mallick <pratmal@google.com>
To: mst@redhat.com
Cc: pratmal@google.com, aarcange@redhat.com, akpm@linux-foundation.org, 
	brendan.jackman@linux.dev, david@kernel.org, dev.jain@arm.com, 
	geert@linux-m68k.org, gerg@linux-m68k.org, gourry@gourry.net, 
	hannes@cmpxchg.org, jasowang@redhat.com, lance.yang@linux.dev, 
	linmag7@gmail.com, linmiaohe@huawei.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com, surenb@google.com, 
	vbabka@kernel.org, virtualization@lists.linux.dev, willy@infradead.org, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 07:03:00AM -0500, Michael S. Tsirkin wrote:
> Add a write-only module parameter "flush" that triggers immediate
> page reporting.  The value specifies approximately how many pages
> (at page_reporting_order) to report.  And I mean, very approximately.

[...]

> +	if (prdev) {
> +		while (budget) {
> +			budget -= min(budget, PAGE_REPORTING_CAPACITY);
> +			flush_delayed_work(&prdev->work);
> +			__page_reporting_request(prdev);
> +			flush_delayed_work(&prdev->work);
> +			if (atomic_read(&prdev->state) == PAGE_REPORTING_IDLE)
> +				break;
> +			if (signal_pending(current))
> +				break;
> +		}
> +	}

I think the amount subtracted from budget here doesn't reflect how many
pages actually get reported in that iteration.

Each iteration runs at least one full page_reporting_process() pass,
which walks every zone, migrate type and every order from
page_reporting_order through MAX_PAGE_ORDER. How much a pass reports
depends on how much unreported free memory there is.
So even "echo 1 > flush" can report far more pages than requested.

Could we use this flush as a trigger to start free page reporting right
away rather than waiting for the delay, and flush whatever unreported
free memory is there?
