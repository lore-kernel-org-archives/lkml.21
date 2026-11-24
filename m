Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516167;
	b=JPqQkHeRJnQk7MMIU+KC+eaFfDTS4M8aQ4/4JQFMpWE9HPIyFp0Lt1QBWXb/9XWQQ5Id
	 G8XUp4IxNtDzs8OMckblCXQmv2wJ3PJoyW9A8TOeN9ZLCDK4+VQrDp27RDTs+ZiXmHkse
	 qDILbXOUJfYX/ETKVO+XkUb5lJk3xLKrJOMQ3viIyXkVq81Z6aMaNPWux+U/nE0FlCwPR
	 YVG3o8ir8xVsdGAr/aDt/rUYRMnER9kNDfIqljVYdeUm/O+UWq47pUAYKnWe11nWW/fFm
	 DB2psozIvZZwQxQ79SXYHho0zLhPYcGFWn2O3NKczAtBUKxn9LRRL1DgjftqYgoesWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NgR3m63+SnytcglSpFEsTa+pIxMIxJNpneEFbxbVTZ0=;
	b=2oOW0In/Cmgoy2jWvm3vPjpZJSY+4Hj072VsoJ+EtTURf53u4CoSU9vRkXCo5FgziYXE
	 k5QJ3yNlQZ5hLFJHuTcGg2oFR5C8oM4dK7lfLwbgh5KmqQVnjyQDdUGs7//WxmVVTjGAj
	 0WEGwqsF5272oFaKWlwLB9Flz2+6LNbdZMB0UZbPsnvNcad63iTBjm5WoOklARDq50CmG
	 uZx63upx9cgpX4PAqK3nBQTQk/+qJHCjvJ6puY/+vXVKGDVunmvnU/EJK7XTsvH+qv35E
	 FrYT++vKQWB577g8NkIKVEtzDA9SuW6cFmu4BYDTqskWMqPiodWTwFu1T67bV2A5ePg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="R5Qi1nr/";
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C34606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C34606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R5Qi1nr/
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c40bbd26f74so330615066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795516166; x=1796120966; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgR3m63+SnytcglSpFEsTa+pIxMIxJNpneEFbxbVTZ0=;
        b=R5Qi1nr/JXeODXucQ4klzURYLoMLDmfF7Zbk289gvCje1WPqSx0UYKEGwxU3BECOE/
         JIpjuXV7BoLKy285p+1XgCrEUTgHR1zkmQJcu3azTvT3MSantV689ZN1p5fRkIoLI4gG
         i1qM9a+kBRU29v1zgCcMrzZ01dR97runSOuzRKIVDNWffsVO07Rx1u/9wax9quvqzb+D
         f9Eh2dxUMy6CF/Sigc1Mfsa0ZRmFau14rizk+D6sdlTrmOix4bQQqUdBria2iZu3SEGW
         DZGnVQjdSS7eoE7iVLCZPrVZypFFRVVx0IIunGNsd6nysz4hNrG5lqDFSWaGSgbij/SA
         3S2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516166; x=1796120966;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgR3m63+SnytcglSpFEsTa+pIxMIxJNpneEFbxbVTZ0=;
        b=iICuPHwlsrSV0nYd8aX1Y1FF46q7ZsVn1sO9iz/hbhUVVIfOGec2jPNWYy/qcgsozW
         HdBzmI5rF1KrTh7kvN7/D5MRBUzHOJXyplL6NeMqV9MH8zMiDGNWHuHb0WgI9IXo1G25
         JJGfxwMmsJQr2nr8+HndbpOFVsZ6J0SPlNPBuuJ2/ImcFP+/K0wp15qAGPswHJHM3Uk2
         LBR7JzLtjUwlEoNOhJhjK3xTn0okSI+VvKEnlvFQxllERIAI2qgnT32LVubDqsC8wrTl
         HIXiK4BJOxiAr7YN1Eur0faVVAZOodPz5S7QRwqJ07RbfJyPi3lbsJLNIAmhMLl/vLgc
         E4Ag==
X-Forwarded-Encrypted: i=1; AL+hErFG/46RS5hqt4CX1uABw64xN2db8S1Cqbpi9l7EYCiGgFc8bckasPkZHPwmTKeM5BWeDPWXvZbt4J2mw6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jdpixaLPGKBbtUfHrqYeTUiy0NIXjdHpkkz/mOPrfL42WC/nn
	7truTAp21CCdet7qV6GqlzSx/N/h++TmbKyOE4+JCt/yNpSmxyIqOU7PQ8dNHeWSlboahqmgklj
	ag4WxGt/+0mUlyg==
X-Received: from ejex11.prod.google.com ([2002:a17:906:298b:b0:c50:7d13:f19a])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:b053:20b0:c49:8fa2:4a22 with SMTP id a640c23a62f3a-c513acaefdfmr762232966b.41.1795516165548;
 Tue, 24 Nov 2026 02:29:25 -0800 (PST)
Date: Tue, 24 Nov 2026 10:29:23 +0000
In-Reply-To: <awVEqEZdHReap399@gpd4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123145927.577162-1-jpiecuch@google.com> <20261123145927.577162-3-jpiecuch@google.com>
 <awVEqEZdHReap399@gpd4>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124102813.217423-2-jpiecuch@google.com>
Subject: Re: [PATCH 2/2] sched_ext: Take rcu_read_lock() explicitly in sub-cap kfuncs
From: Kuba Piecuch <jpiecuch@google.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
	Changwoo Min <changwoo@igalia.com>, Ryan Newton <newton@meta.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrea,

On Tue, 24 Nov 2026 08:02, Andrea Righi wrote:
> I'd drop this patch. The IRQ-disabled region already provides the
> required lifetime protection and the existing checks recognize it.
>
> If a future change introduces another dereference here, it should use
> the check appropriate to that protection, such as rcu_dereference_all().
>
> I think we don't want to introduce additional RCU read-side bookkeeping
> on every call to accommodate that possibility.

Makes sense, especially with patch 1 switching to rcu_dereference_all()
as well. Will drop this patch in v2.

Thanks,
Kuba
