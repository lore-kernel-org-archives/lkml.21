Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657796;
	b=iaVxNaC73IU0QpiMyZCYHvwDogTFh6GjvIO+2/jjr+LgyrMJ5suoK9gWockYfIXhnfIj
	 WncjL75gTnvQV27CvziTMiPiH0RBzZEdbFgJfI5WucWiAMPawu8AB02UFtP1ApMtHmiHl
	 SHCMzMowQQCZnaQCVqjloXGoLGoF26ohw99GpfDitqFmQlOubAvQlTlnPghG00X5CR8NW
	 /k2m34Q3a/QGAEfs+9vuE6Q84e/1cut6n3yR63NrHojJkZcWWDhXZq8Zmj+k2PVCFQQe+
	 8jbl3wpbinhqhasI/kIMwFba8kHBhfB22DstMHPzOMQ3kbOGD5AZ3JrQ7OcGnXAICyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cw/ZCD9ESmIvPuVt31//P6WCFhiNU7mYCdD+27sv2XY=;
	b=QqN4iMwwsxGXZd8EA4eqDcpSET/2jPso2uuYlXAW7/rM9DeQhXHsNBDfmAh48HjiYnTj
	 5T9xlhvABbF2pWTBsi6QFuWzcRTu/xbcnA6SMWnz1MmAhgWtoKW8Tc/WVAZnozoK33RQ5
	 0eFjs75+lzCqqIxRT8JojbrdBzdXTfgqlpRldiBvHHEn9PCP8EqKRkTxTw1RfTMUWzacG
	 ejbwl+iCN0FMf/ADKq3bI0+wwaDBh1Sq7eSKbx1B+tNSvmIjTuZqxJNgA5GCHVdp5EEjN
	 iXEZnmrYGxfp2EZWzIdoNbwZwVZ4DpHKEFHfS049fZzfq7QjKqMgxuH9+fIkqjoHSYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dv0WJtS1;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 725B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dv0WJtS1
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3815478f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795657795; x=1796262595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cw/ZCD9ESmIvPuVt31//P6WCFhiNU7mYCdD+27sv2XY=;
        b=dv0WJtS1Oa9bALH4bZIZ0/4+htuV4Fr0HVoUrStZVtHMceAIIV/Qb9myaksaqW9s0f
         hr7kGd04KNkBN3Q/lVUO1pwX/xicdGKjOu5pB3ioQPFf7aXCOOH2pED0xkmEKcs62YFW
         +XQylm1QUYKTjN4oEICBYMcxlRal6V3FXHghSw4ECDk4TQtlPsas5T+bJiThoG77wfu5
         WF7QAaNUAzGVQGtyRpwxp2ytlkjycH+cFRxHOU1BX+r2xKlTQDhTda7XqOf2sr3Q9hiC
         mOjtz01RU4xnvcoMUR9dATR7R9GacXtIlmrKvzmSgDmI1kNYr1/CPRaXUiLnHDhcZQ6d
         /+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657795; x=1796262595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cw/ZCD9ESmIvPuVt31//P6WCFhiNU7mYCdD+27sv2XY=;
        b=XR2ZpkK/iECc8IqCZYhIv1059Lp0TwLQLEfB2l3YGnIAMoKr+jabK6tiQwzcRQmv3S
         eSN/qD0WhFfuuot9Rw4U8sTgaz3bHN4yQrVZ/KIQmRHai3nLIN5o1qCrQeqNb93PfUz1
         K3MyJlYEbbvSP9gPSdWwHtdAiDK+EQf5wroj5QlYA9JabgZcm3wxCosvzV3YkLF6jXe7
         B2R4TqmM7/nya05C0jJVPt3U4vPWV8eEvklkWlpx8IGb6eY/kH/6GJy+Z9tJ8RXPJeKf
         R1eWmhME/ae9xGCCxqSyBK5FqmDqQ6eC/gxVYec8YAdHkZhjFB6ZAab7I5Mh+ty7Ko+M
         Tltg==
X-Forwarded-Encrypted: i=1; AL+hErEEe7/OUDTwOFuOLghLG9155/7iMVgG9IQbtpEIRlNrgo9e7ki1qOxTGiqB/KZSEXqX1o51qbgLeUlXlGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/412j0m23T4Es+brkotV+grT1wof4V5QTZIs5DuyI6E8F2jz+0
	s/G/xQ1KJoyUuMi2mzxwUpbOdCag/dCmnCIErr2qs1JSaTdHaBCaWaCN
X-Gm-Gg: AZFdTZchuz6aeoCmvJr2gj/aZ3n6mzdNnrucuAnk1HLfXiUHyR5ObcHaw5WvWboJPie
	1HAKfTg34hB7MPILLsJV/hk2BYzXPhK5rIydsSoT0rlRz3IPGl+HWIfoIbdWJ/Icnmdckwav/FI
	MhGgmKrUXDH/uZDi9CE7gm0mRFIU41yC7CFkkSZaosyi1nznbZfS7OP9RUam2BX07az8x+RWxZ4
	1RKxY0OhKntRVOD70J6jzADmWqn9Xr2CmeGgaALHRvFn2/37o75AHUj0AXF+48KlVbrpXDriMKN
	1E5nsj9AJ6NqCcCj7/13akoMeF/MHz4Yh4fB1/jiQfEE4G0UNta/yELlenKopJbJ1qc39xxJWA3
	kd6ZB+njfeH4TM09q6KLhTY5NVBha+OSSWDOx4VOjUktxxxhK2qzzI5QuY6xQ72BoCXxB6m3vVU
	2jgVFkhwweJR+/Kcn9yf3OQv5S7bzzktd3Jd6QRC53U3teVT1b26FOO8ihm99lkmepImPorXpg+
	946Jq/YbMfkSVORVmjruMyjDRPTj0T1naPECOa4URVUnPB58YsbuGOcBuqxMk/B12ImohCgNil7
	I2P3bDYVD8F483v4bLUh31uMKi4/WfwQX+gSKqApiBwWqzg=
X-Received: by 2002:a5d:5f91:0:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-4abb386134bmr34709391f8f.18.1795657794701;
        Wed, 25 Nov 2026 17:49:54 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4b34e9c3ffesm21483408f8f.19.2026.11.25.17.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:49:54 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: josef@toxicpanda.com
Cc: James.Bottomley@HansenPartnership.com,
	andrew@amutable.com,
	brauner@kernel.org,
	jbingham@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sergeh@kernel.org,
	taherafahimi@linux.microsoft.com,
	Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH RFC v3 00/90] cells: a container as one kernel object
Date: Thu, 26 Nov 2026 04:49:19 +0300
Message-ID: <20261126014919.2135815-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
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

Josef Bacik <josef@toxicpanda.com>:
> - File capabilities are ignored in a cell, and a cell can drop from its
>   bounding set without CAP_SETPCAP.

This is useful thing on its own. Don't require CAP_SETPCAP if no_new_privs
is set, even outside of cells. Similarly, a lot of other useful things here
can be applied not only to cells.

> - The host runs no usermode helper for a task of a cell, so no modprobe
>   and no request-key, and a core dump doesn't go to a pipe or a socket.

Again, very useful thing. Consider to add it to all non-initial
user namespaces.

> - CLONE_NEW* being EPERM in a cell is written down as a position and not
>   as something that is missing. (Andrew)

Note: it seems Andy Lutomirski (CC'd) wants something opposite
( https://lore.kernel.org/all/CALCETrUD4vh_iSHV7G0bprUFU8=c+ECo701-tXcbQ3UXBWC1ig@mail.gmail.com/ ).

> 8. procfs, sysfs, devtmpfs and cgroupfs. There are no per-cell instances
>    yet, the builder assembles those with what exists today and can get
>    it wrong the same way a runtime can today. Where I want to go is each
>    of the four taking the cell as a mount parameter and showing only
>    what the cell holds. That's a lot of work and I wanted this out
>    first, but I would like to know if anybody hates the direction.

Again: consider taking userns as a mount parameter.

-- 
Askar Safin
