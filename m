Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433999;
	b=HiIYYDF36mm0niYkooSPuxj4PIo23cSV7QMp1IjMFm2XvRfhogNzOvyhu4nYs+42Bson
	 P56tddC52Dt/KwW7Iby5CT15s0ucz6paxl76aducML0wifwH1WdW/Z7gg4MAEzOUnb+A1
	 TOxH0fHhsykXcrRfqiknut70hBq62gTxfANhiv8TPJlpCbzB8s8Uug8CYHs3esmEDSzMG
	 lOe1AjwCpXG7JoDufIWp+LyrJxHn3UKoMZnVbWMSDnIdMTPfc/Pd78NcCBl0Azmk/BUUl
	 uemGw/QRYSBz0zixXVep95xp3/qa64QVgVxU5uLidwQ1nX1V76eHGpiAuvCUquiSEZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dzG3GXZhvfXV1CjH4z9JC/RUQc8XXCYXZlNff5428CY=;
	b=ItGMr+a92ZeUxKND3I9dlFVbSKjYjSLoReL4Sc+TK24ZAykaEgdK2erCnuSH27IvhOQP
	 OAGjUYurWULqLywrpWmhc/+QWglWDsRHoP0Mf0HB4P6GFmpBCrtvJa9hGxyuleYkbONPz
	 D25DExs7Cz6gsCEto5m7nlD8aMb4OHcyaa/wj4hK5g4egSpyDY0DvDGO9F+uuY6SXs9Da
	 LRlwz7hha9zDY0kJZaJAUvi8vgah3P0soPUDPsxcLF7C2IRML/QkFTENGL410sY+TSUdY
	 jNyaS3AlQY7o8jY0d/PSaB3Y79a5yZa0SqAnOObGa6T1Sgfbe2/A+5f3tuuXBF3WmLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2dH5veA;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E2D606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E2D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2dH5veA
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0458cc9easo22383775ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433998; x=1796038798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzG3GXZhvfXV1CjH4z9JC/RUQc8XXCYXZlNff5428CY=;
        b=A2dH5veAYU9uoMnrxmCkRpQeZ0A/ZwDFNnDLQM4oCIdIkraVq13RcbOIFo5ogYHW34
         yQEXCsWBQBd5Oi03QRr/O7Ge9qpd4RlbrSFDsGIEDcagzszpXiPvKQC/9tioZWqMapSx
         CnZjg/qRD3DcZv0suqf0F6vnaXAyYJi2sv2CmvnHSziWmyD1ctOCJX9NM/wYuV8ZcFOD
         u0QHblU1m6MXTIUlqb2N02flLxsbt1XVqP4Xa3q7GL21gplmPtn2NcmRpbggGx5lpZ2y
         xkXavM2K+bb/WDFqfj2y+9AN4RRXWZHaaVUSq4ibjQBlOFIxzl/qBmAUY2V9lzOhBrZd
         fFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433998; x=1796038798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dzG3GXZhvfXV1CjH4z9JC/RUQc8XXCYXZlNff5428CY=;
        b=IMmMGdMBsYu/c0TMAhBjH+0TYBK7HbLlpPOfmX17PEyJ0ZLgzpFZPQy0YmBqeYkqGz
         Ni0wi5KtelMuMSNixVnWoUAnUvdGYcnNoi/ZcyIk+Hz6lnU98e7YLfeCqz0aDTFnlJoz
         ximrMnwiq6xJM6gCWX34w7Z0BF7nHaBJWAwSDgTiJl9R03AN1il43CZEk8toXAd9BTzS
         o7gj6QTxpkggPBGSa7uY22k2tgLsrkzYOIiI+erVhD67HTd4Xhnn7bqH9+rwKP2JHtFo
         NOJAexZB39VX2U60N1A7VxIiaeAd/S9Y0L77rW1tvot4m25kQnyRIg5bPQ7HJt05PJIC
         sXeQ==
X-Forwarded-Encrypted: i=1; AL+hErGQAnzAN5ADleWXRpXgG4OACUwn8TouVB51gVkWbVp8Y5SQyP3I1Xymcgnn5CZ+ZtBQ3yGlkBYZXq5AZXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o4QhO/x6bHhV5BI/6ycsU2th1vTqL9uL7dzPByax8OUZK0BVB
	PpfKsRETfQ45VMeccnaG0dCSKtOONX1iq7JLnxb1rP72uXWioYvsLtuWVXPqnnA/
X-Gm-Gg: AZFdTZdDA5TmxFgXZIJsXZwMVnGTf0pnramg92HZNqcED4KGkdJemk4/5RSRwfu+pzO
	kJ+LyeojzV7e4lSGcKcO67hdDm3WfRU/TgyPxtMcZhIoxoRMZBFJHqxvMGsg+YjpsSCde+1WCX0
	6HvMRFbbgSsZPgDZNOrnLQDlrIMrffxkhhfMxEhn7k65PisaExSslDgU1EN145PSJkZDh9zTii4
	RfsLtV3aahXkinfb/upkEEYPS8wjXkcqVM+U+rXmPh5ikJ5HhvEL7OZ6dpN9Zt2++uT6wu4OuMO
	IHgy9qfVrrjJubcRLlxK+jXj5pDTgelNKKI7ThQQN6xsAC4eHCdxTCq/6F6dXBgu2MsWV4V9pqi
	wgDhLqex8kCsi30DZ9fMYWK3nesxHdmFA/z0za860FkuD6y8N9O1lv7hdbIg0btr4g5+L0BnqiR
	2BtI3LfOhpwK0HqxktJtFTFD+0pBZ7snZLHSJV0sED9p5DlI7uvGH8iyhQLTTFgq12omu7Qw/lK
	idISSs7BqRMRtlzc9XjE0cXagj73ZhIDFJYW+S4zIlAelneyr/ov5bS0/T6wiB2guwKuzfCP8OJ
	Xhng934NGL3PIWzYYafCeM1mpqJc5gtQLVVtH6JqpGen6A==
X-Received: by 2002:a17:902:ebd2:b0:2e9:970c:2c9 with SMTP id d9443c01a7336-2f03f1c75bdmr133283195ad.42.1795433998310;
        Mon, 23 Nov 2026 03:39:58 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f42sm51601475ad.25.2026.11.23.03.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:39:57 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: tj@kernel.org,
	mhocko@suse.com
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	penguin-kernel@i-love.sakura.ne.jp,
	mkoutny@suse.com,
	chris@chrisdown.name,
	cui.tao@linux.dev,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v3] mm: memcontrol: don't miss processes whose leader has exited in OOM scans
Date: Mon, 23 Nov 2026 19:39:51 +0800
Message-ID: <20261123113951.1771223-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <305c5803b904a57c188b505d6ed9e1e4@kernel.org>
References: <305c5803b904a57c188b505d6ed9e1e4@kernel.org>
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

Hi Tejun,

On Mon, Nov 23, 2026 at 01:13:25AM -1000, Tejun Heo wrote:
> Maybe the leader can pretend to be in the new cgroup instead.

Thanks, I'll implement that and send it to cgroups.  The memcg scan can
then stay on CSS_TASK_ITER_PROCS, so this patch is not needed.

Thanks,
Zhan Xusheng
