Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190864;
	b=JRUBj5nTqE0N29BmNHUN5SrzR31hJqgNQ7kzcwAhGKETUw4hEJ1f9b08A2JzF88nzxYY
	 6ITc0RvUXJA3b0o1YrRpUGa8K4hKynpVQluJvWCAk8U9yqXlaoHRrVs5BUm8WAqO0xD81
	 WH+o78PQwSeIuBcCJCfvqBYcIgDwo1sXq2eFRwd0urzEXyxvx3eZyCRIxlXmRppQBPgq7
	 q6cgE1glGQUJ57TCTgqafdSzjeJxZBEmPkJ7ObZ50I/86J4qO4oO6uO7FDmhrbTpg8nQK
	 scVB8rjkOnPTSaDjGhyGgHwdCLmj793f8MQ4Fsfweitt7rW/wRt/Ckb8dthcJbBbloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TBs7LOLsqlBa2l118zldqdkz8VqMZk4EmM0/z3WSl0g=;
	b=SbAgf/5BSh24jpG/netr1aEIOoozIIeRclkgxLYUnToE3BT1F5YdiFeF7iUoCT+YN1Mh
	 cmkeVLH3TXPRXe2ei6vaq0D3bOgFUtRyeU4y21/HvWlD4HzstVpG9msjJxdM7RvbKcohD
	 PZL0GlcW4WXUsVPj1ribWhGQ5zR9o+AhVSjVuZ34U7Hc8o1TtF4Wq3qZHJHBpgG/3lxJu
	 yKT+aQ8Pl04ce1va59RkTzI4Z0YQwfynUjtdw6ocGCTud7Mb5mWjI2eBYP0U/vmAAA5eu
	 slGMnk9vxi3pWn1XDtwMcHJas0JACqQRAY1cTW9J9ye1MXc8wc0NPJD5b32Y1PF8oNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U9FPy3z1;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFA2606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EFA2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U9FPy3z1
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1450717f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795190862; x=1795795662; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TBs7LOLsqlBa2l118zldqdkz8VqMZk4EmM0/z3WSl0g=;
        b=U9FPy3z1Ah3rO6PnmTG40mdUh7F5mJijJd3VXPUjTGEt1xQ2naZTeJv+4C9hwXa7UZ
         uiC3GVH5RBjmD9ahmLwJeQywXC3Nb0m64W/8dm40AMURypJBfKbLVWj5tCeiUo1WKDjZ
         4eDylj1/GVP6vZzNa3sc2/AR2TWqNavKKt+bOQ20MZF7UZTKdOJiHeBlMw+1s4Bpxsbn
         Wqxdj7AVIXwWXeYuNXsLXlmTX8rmJyGknlahNzCqIqtLJ30H7CXSdj865u5MhmNItPn1
         tVwT46hEkmW+YOBbKvyv47E1gpnzj7h4jp3y/wN2ozQychqk4ftTQ9n2iBmerZAlVUs9
         lXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190862; x=1795795662;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBs7LOLsqlBa2l118zldqdkz8VqMZk4EmM0/z3WSl0g=;
        b=DM/1kMB2gk9Thhf6292o5jqxPRdA1+6MHdaPKXSolvSoXmHMVAWAYs04HB+3bKRYLm
         /xj9YknkEOSdlUM5TxUIdr5t7pM73JnLWFaG/EYcZxuhaH1GKjJBaHty9td/0FBeTkcX
         QHX4GnDQ3847BsiQJh7NETvkYxTqg5BZgt93oZ3DqSmPzl8huwPxkMNiiPCf/SXo58tX
         DIPGFh4ErR7ytE/LqRnF/RNrTfjliJD0bwa6QhQKTv+EFxia2NxsOauqPzZz+WfHro7k
         i1PiK9AklFTIjacbLMyjVYhYHb/XnKyZEGO8X6RyzCIDX+9VefwqQhNyuHwcQk6QQhZZ
         mg0A==
X-Forwarded-Encrypted: i=1; AL+hErH0wCzzhpADDrH0ofcLkqkkh21fwpNXijN4o8BB6wDhlKCF3Q3YRwEpHfAIdK2wt4dylmnI8KeTcUpLrl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JjvA3vb4+2vl125OIt8npyJ0E/taKetT+5FcYi8iygsxOKyHM
	cPa746bYst7J+cAiJfS1xHzLr14K5uoHJok4cHOn82Eu8SMjVU1aP2nC7fBBgNqW3Jg=
X-Gm-Gg: AZFdTZfSBSMmJRyrpTBtKBVfoKQDhFoA+MNBVSb3xIa4HP9iy6gCnsMc/s9Mg42I2gB
	ePsoXt1XfxGh/rz6savVXpjxDef1CICqSS/XLdvies6F54hP3LeskmUU5zqXVTZte3BKv5zkaNs
	DUJ/2teuvq0byIgC6sPUszC3NCfs6Se9ToFmtZK1BuDQWA4AMryUmRf5LwuGmKvE9eGaWwWOd64
	8q4WRSctAVvcEPJABQgUugksP1FENeV9HHt7J1D9nnM7xkmW+24zhXQxbClOH68/nmPdrSGvbM7
	GhEg5ko7hjjNzoKiTHOQ8qnuCqa+f5Fi4ezvy8kohzU+o/0sSMP9TY8ag1I+Hl9fa5nsTYBll2p
	hqIuRAx+7GA7Sc0Kl6iMpxFon+maKao2Cjm5vIHDygxiTGtqmT27TOhOcG2cWHxVfMg5/uc1q/1
	erWMfEqRODq2x2Wpp8vrjhQEpbJk/9TY3hdFaqOIk8vbztjRSkYAE6tZ/LyTggu1aoV6ctF0gdd
	Y31p7KLfKHHZlRECieKuIpiMLJoK/fsPcg10FQ9nn/YkdpEFhkgqUFLLmdAwiOnSdwikIPGp6OG
	EjunDQE6WHvzPhZ5VqUau0HWsKRwbLAHC9Bvgkh69G8ujc2i
X-Received: by 2002:adf:fc8e:0:b0:4a6:4ac6:d94f with SMTP id ffacd0b85a97d-4abb3956acamr6142453f8f.19.1795190861753;
        Fri, 20 Nov 2026 08:07:41 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf629dsm5958324f8f.9.2026.11.20.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:07:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 1/2] dt-bindings: gpio-enabled-clock: Add a new
 binding
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
Date: Fri, 20 Nov 2026 17:07:29 +0100
Message-Id: <179519084920.3795820.18319787881002052092.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=582; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=cWouKw16O3+lMqOqcbR6ybi2hZFly8D7u1jUz0/iQqs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMBU7J3bfZTBRXpzy88kisbUduVYB+t07Y+pUvNj+1l
 7wmklrRUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgIncDmf4yfh5kavm45xVa+p6
 na0fbhU7+9PgYLrlwZln+ubMOvSxUo+RYeLPCS7BxxnqJbuDn/SfkXrA175ufp7y+xuRJnnzd1o
 68QAA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add the binding for gpio-enabled-clock. A GPIO-enabled clock provider
> exposes a clock (can be any type of clock) whose availability depends on
> a GPIO status signal.
> 
> Some hardware designs provide fixed-frequency clocks generated outside
> software control, such as by FPGA-resident PLLs. While the clock rate is
> fixed, a separate GPIO signal indicates whether the clock source is enabled
> and producing a valid output.

On v5 I pointed out that the input is not fixed in general. It might be your
specific use-case but it does not generalize.

-- 
Jerome

