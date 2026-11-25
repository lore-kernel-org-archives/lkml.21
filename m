Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573101;
	b=LvlEBUJR7g9UJ/2313LdE4n+8zlEZws0hcrDOMxEu3IWVbxM2AHtVGb/yM3DetWcOPBJ
	 EHZQAdGKCbhy63nMJPushVkzVWWliIzwaM5gNvVW7MriGEk6cZRJNnOiF6gWdajRogE0+
	 87Zz9OEWJx9RpGxWF+8vU7RyDLqx37C+27zKPH/mFEwxgdlQ52F23/GhP57jmX669ftDQ
	 7OjBdp8COJMLuta0PDovqP+/MLp+JvX8LEBpJTPH47COoP7emHY+DCIVyyKfIFlS0FfaL
	 UKAX8ewaMN/IHOEzpTCW1l9QQkI2XnmiqIs42I01216TQ+ItKayQe/t2kthgjP6SNdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BfBc2nl/+x1jei32QWJml8gTyYfpGpADR+dK5QnbKzw=;
	b=1ZArsh+mW0RwGRNE77HeJAXAGfj3rRtg2xrS99zo/+Cn42RiINqRpaes33kto86dIl6U
	 pZdToIW4+9B+dc2CMhfXQIFu0wdcbXzo3PL0OKECSb+LPA8+NyUOM4S0y7UXcdMJYmzkS
	 KnsBuBPTUs/zTaGfWOh6vqFrq0Lu8KzixmM5UBHkXMSOB2rcWCythISJPuqS/NkxK78/7
	 7sZjB3a1kbGZa37hjpkF3MzDANE4R8/c8LU8El/lXjmMTPPkz6iFdOQ8gTzXykBg/JJv0
	 Bv63oTiMeitZJsVjMlfFiBN42bhMyzFdTmnJzx9MRf7UEE2zQXj7hJcrk5K0RQgaCsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMUfAWXc;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B73606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B73606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMUfAWXc
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so2998798b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573100; x=1796177900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BfBc2nl/+x1jei32QWJml8gTyYfpGpADR+dK5QnbKzw=;
        b=mMUfAWXcVM1xIZ/sjsn1fq08fH4cNvvV+oUQ3eA29ZMZ7A+eR49KLC6qpO8DNy1F2r
         gkd92auy0Mt4Zky/nz7SbVEL/AGIvelnKaoFgD+J+iDepSfvxxqWY0+T0Z39kxdHTzTY
         eMscrxm14uebLO9hUbvAA+qdI7KIr5bdpvPWPLiyqQe+mp5hQH4oZ5Ub3qD3qJ74mSua
         sFJIhhKkRaV9B23MWw4rMZLzDyZ7CbJxvlRCJ6Qpqb1m64EzWOGlB1eu9cvA2wprbAwF
         KXWhsJVnHVM8dnPdGTgKarfqJIVO7dc6UBO0xheja2CQ0m0G+8S0YM5Dy4YVRFWmMctE
         dIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573100; x=1796177900;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfBc2nl/+x1jei32QWJml8gTyYfpGpADR+dK5QnbKzw=;
        b=huw0yoMk+eWsfNvXeSTnfeCYJ+Yo/ilmTPyotHcu2nMah4BjKh9nKxVWl4bq3C7jRR
         QMNjV28AkMBQW2G1HpNttIIy8Sues/6hu8LmxlYn0XWX/1EoVhq0BX8uuD+Bn1Rk3sK/
         fWKj1vsEFNAS3EOyyDN8ztlKELVCqTBRyN6sF905ea5tmXXlxULz2g6gXpq2PQWuAjTU
         rkLHxqL6mfrHbHE2xRQlzahzpU2PQUgz3B3I3oiZ8KxcKXSJfXguaPyVKE1AxTf8ueNN
         PRl+RjE46O46DTs89LYoPLw5K1NnDYJ7Mq447lFVxENmLOVsYn1APSdzUyts7k+hc+QB
         ssvw==
X-Gm-Message-State: APuU4Z9OnN16cTNXIrzCfhXGngfbUK3pQMHsiIR8CFUN62vvrT+GTujE
	byUcPKxFcbiYiz3yCyEmcnc9dLBzvSIB/0JnC+PXoc1jwRPARrgERv1H
X-Gm-Gg: AZFdTZfO8JCZSlNreVNScRRjp4sFh2Yu/snjRJed0qmWbS7tmpwKe7flwVnbFGQdnhi
	SJHEqane22YIxaZWNqOLCjsF0GWstP6nLx49ObM+K/uN/L+qlQrcAWRcstrBePT+TAs/XwCMzVM
	3QT5vZkUC18KkYJ9ewDhpY62SFf2UScn3CwTAmpbVUVo7r4zpHLsjulsx2/vJtZHJToY9WUArf2
	gBSjuftZ6NpurbShP8g1u8D4n4wckpRWvIF3JGtncNBwZSa+5MRdD20MDv3JF3OQzetaMPHtym5
	BNBTQxB0GpEUT4n7duhZu12RaTPXXUlcJp6X6mHGajCZnQwHSNh4VuR8I+2LraQS6v+H1b28wKh
	ohEFwGZFiqr35jTIDWSSmt6IDcqb1BMvTVj8qECUtahyV5NubXHghYZdbKncmWt9z7SwUCi3/FF
	dFYJjUViWDIsYw4iI1IeoiF52oYcJkFSrdd0JybuXY8HMY4DW2DXnF7WcRgwdJ9WKF0h96TnzR9
	4CXqrotxXhdUjda1RjWVitXaYdnvzE/5RnrDsiySr3n0jAwTMWdmlFxFl2tAzQ3Onj7I8Onxm0i
	dclwyevn0WeIDeNt6R3mTBpZx+DY8hqJRFwnP76ky86rUAoCngioFpUl8oCfoXuQdC/hwaWnTy8
	HREvgyqCQjD8RR3nEYR4+8zEJvL5sUM7//FR46HZaor/vgwwE68qO4vQiZxbACEfu1A==
X-Received: by 2002:aa7:88cf:0:b0:8b6:594d:7030 with SMTP id d2e1a72fcca58-8c87ca51fe7mr14842703b3a.42.1795573100263;
        Tue, 24 Nov 2026 18:18:20 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([180.166.22.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm8048734b3a.31.2026.11.24.18.18.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 18:18:19 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com,
	pablo@netfilter.org,
	lfinke@student.ethz.ch,
	netfilter-devel@vger.kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 0/2] lib/ts_fsm: preserve patterns across tc dump and restore
Date: Wed, 25 Nov 2026 10:18:14 +0800
Message-ID: <20261125101335.7868acd102b6-ts-fsm-ping-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109103454.50617-1-zhiqizhangg@gmail.com>
References: <20261101081736.51803-1-zhiqizhangg@gmail.com> <20261109103454.50617-1-zhiqizhangg@gmail.com>
Content-Type: text/plain; charset="utf-8"
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

Hi Andrew and all,

A follow-up ping on this two-patch series, sent on November 1:

https://lore.kernel.org/all/20261101081736.51803-1-zhiqizhangg@gmail.com/

It fixes a userspace-visible issue where restoring a tc FSM text ematch
from its dump can change which packets the filter matches, or fail with
EINVAL.

v2 describes that impact, splits the fix from the KUnit tests, adds the
exported-pattern equality assertion, and includes Cc: stable on the fix.

Could you please advise which tree should carry this series, and whether
any further changes are needed before it can be picked up? I would also
appreciate guidance on MAINTAINERS coverage for the new
lib/tests/textsearch_fsm_kunit.c file. I can prepare a follow-up revision
once the intended coverage is clear.

Thanks for your time,
Zhiqi
