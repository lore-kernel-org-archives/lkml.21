Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853262;
	b=SouNad3XMUiAiRwFT4YkTnOSn0BikoucwIknJOTD3gVK8PXxt6yqCRjgD8JbMcrxkwH4
	 W30VBNzRx07h1Njs0vasE2K9d+YPRpkitMn5bVeoYRLuFozzeBjuJGt3M4FUvvuiupHMz
	 lqiOt4mQWSudFj+GkQ+IM+cHhug31i8yx/jOLhojTY4NkPoCjXBTlihUAceHmlq0Wvqvn
	 ur4cWYNnKz7zEbwI1zWEdAUrgO0+/em7Lb4+m/+vtc86lKkvPcx3p3dhBIoElrGB68hxl
	 A7FDgh/aWAchxbm7Ik+bYsT7PDLcacVRjflqXrlulOxSk5BphEEBFP6xHEx3oh2mPBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=weWIpAhr3amneDG34J839D6yvW6FBK43ztqdqUfv7tA=;
	b=fNOwhi7b5fvWT69JHK7c4uLxNST1oRnvqNsv4USnGfqMS8NBZDymWbD9RznXtqPWZVFX
	 xr/YPktUShiUWLz/VwzF04htkj95rd0AjwoXpDa81nVrMyKsTzcJAQGXwBgHeAbXc0yq2
	 JFRdWD5jxTto65zeEowD4wqF93XdsScMyfxVZYzQ6r5u+gXsMQ0Cj7HK5mdVUixnf8BmJ
	 A03Qnn7SIOq1l2l9I1aHP1RAi2Q8vw0bu6j520GXr9PdSdo6qKhUDDKoqBTrcVmn1Z6vz
	 a52vjvlFai3wG4QA6V48e2udHgD6HkP2lAhWSltpdunaBCgkQqqax/flkOIEuh6YM4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/7QQlrj";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038AA606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 038AA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/7QQlrj
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38644aedba1so13969688eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853261; x=1796458061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=weWIpAhr3amneDG34J839D6yvW6FBK43ztqdqUfv7tA=;
        b=S/7QQlrjf5c+5GLkeifjfXwL26EyvWZYxdMbgQAZraUOuwo3rZPLQGc2TTFzqW8P8q
         FeQjTWQ/6J87HVBvIzXd0s9n7Z4S8OOrLWuKfaBpV2e/vhpH5mmh1jDAxSa2TH8qqKzi
         mLnWx0CY4iblEE7hXDN/GXO2GmtTxUM23yfvC1adq04yY/qeaLw1eDUDddyVNWlBgvkd
         +eG7AhDglYXjgU4erTgJVNoEv7QX52CstCCtf99+I6Vd5A2QGLMcdJrinHHsQDJy8MvD
         kOIWXJCi4ewGZoEKqbmn/eTWPXCKetV9l/4uQYbqeAdknxfo4ujoW6P4zRPmd008obEN
         qZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853261; x=1796458061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=weWIpAhr3amneDG34J839D6yvW6FBK43ztqdqUfv7tA=;
        b=2xBZcmj5kwWjoPUQnQc+Z5qlzqIOaPytbHknkD+sthsl3gTqJfNcyRi4gPrfDE/UY7
         VRw7uuX6vh7Hb23/sfxmpgsYp/B3MsSHwqUelWkauVzcNLwy5fg4+ivWHg9sOYir1Han
         CPtr+XRO4lh883Jmy7Ag01QBwSbZxOBMebVNTyJAkL+3KJ/jt7QiLvoUH9VRMC8fbWxF
         XI/seAWkfmEe3KrFI2sb1lj8ZuKA4Bh719tl5ne97QYd1i8Cl3edjawYhI0Xk7NFW6hz
         rQ+iUAG5MvK0SazLYMudJb+/ztKfe7xe/KnODIBbKOMy4b3l9N0Anj6UQxuOiOXV7qBD
         N1Cw==
X-Forwarded-Encrypted: i=1; AL+hErEa/CR4yguUXHxPlXHusc+RwHgPybX47u+1OLkjncFtiPXcDc7tiAgnetrj5icZpEF2a8JhFRFB5+JrwPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z99p5j9U1KYxQ8JWrhMLWXW3nC19ex/hUziUlDsCgA0orKVLHeH
	8TGNC/u90aWBoHy8SdydSBSCN7kJ8ee5XDgmpCiuWN4Wia7bFknukISupCvMczVqkwY=
X-Gm-Gg: AZFdTZewThdx7qHI1N9QtVPztbPyl8URNA0DjwCdVbLppAvQFQ2YSDP/qFa1qOktNh2
	dO1jH3/nyN0Z10lcTpSjGAXzcR1gpGTSW/KzJc68bdyEykYDW38TGB+9G8JI2vPG13GOhH6J580
	q/3x58ANW2LoEGBVXu+7K+QhuqBp4+E1+eoKiRH3XtS+yS0oByAA0E+mc8MnmG87f/yUTbLoFCC
	rzRtKJ+yHq7vJMbhR23c4V6KEIMjjwMRzXNKTzMYNqXV2iMPU20x2UgEJ3Iz8JZn71Omp5gDKkL
	x+Wf+/vij0rnyyyEqzfFjmvOUx8sNcfh5S4Ave1blblyCshFY5MfXyMoH5x68Bvqj3ZPyWQL0qh
	eg3zSRVgPK65qC/u5chN0+USsczgFGpqAzjFa1D8nAL6VtPAwL1wv6kfkajYKbWAZf1jySfCS0m
	+/d4aJj09aZzah5oEWGVdvE03TkraWfjztLC5orZIXpfKYtrD5r7U6Xu/xN5nM3N/a9cqZpteNu
	Od8lBhYRLmHntqMboZ1mXuOEzXHgZniY3Q7ykDX4LEsbUm0PGnjEQ40sQb6kKaubADJI3KuitmP
	OkWz2l6+6efOuaVWfpcQpJvAbg3RklczP112rFqgjE8VF3rZWNgQ8PibqX8eMtPcIpYp
X-Received: by 2002:a05:7022:3f07:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1b5568650c0mr28575922c88.8.1795853261129;
        Sat, 28 Nov 2026 00:07:41 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm62581012c88.8.2026.11.28.00.07.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 00:07:40 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 09/19] mm/swap: avoid direct reclaim when populating swap cluster metadata
Date: Sat, 28 Nov 2026 16:07:10 +0800
Message-ID: <20261128080723.37536-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACePvbVr7A91ya6P9Sbx9s+V6cVqba-avHCBnJDViKW2f805zg@mail.gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com> <e920cffdb3a65905dbcf51fa3520785a8c49fcb4.1795439990.git.lianux.mm@gmail.com> <CACePvbVr7A91ya6P9Sbx9s+V6cVqba-avHCBnJDViKW2f805zg@mail.gmail.com>
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

On Thu, 26 Nov 2026 10:34:19 -0800 Chris Li <chrisl@kernel.org> wrote:

> gfp is assigned and used only once here. You might just as well make it a const:

Great suggestion, Chris. I'll make gfp const in the next revision.
Thanks for the review!

Lian
