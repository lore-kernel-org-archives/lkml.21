Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757596;
	b=I2vnoO8vVrtVoDxJxmCdUOsZMFiYE+NUYmg8m2LTB4VyEqwJ6nMdPZj2h7w30qfmIQpq
	 0y4Xe21JNlp7aS+bl/Hcr1lRdJoCo/BX/U3DTcuIGg61SzBJDExsmaTMyi7fXPQftxS65
	 Hhmm9qIVhBXIh4frEn3XkEmwLsvEgPS5jFm8NbJ5UissebprY6Jsf8nUKDAjrNVKODCjQ
	 RJpfVKcd+Wf/uLjekiT+seiuCbpDwwSjkEONpx/nXqjpa4SA8tlS0LhRNCSPx2RmCN6JO
	 EtXUqfiv5ZQU0pBQ5zH+Zr86ZY+4B1S9YFSeeSmbU86yYm3J6UN+0Fdw2On0u1byLWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9SSLJDkhxBZi21kj3K+IK+QTqg+ejmmv97gXCsdfGk8=;
	b=SNBZ6yFf2EVcsCnyXVOllUJD31GHqNSWNlz+14MTn6QFpahCuHTpBJW6S6Zf/FQG/WMX
	 fMZCLS7ORVNTzgrzWFjuanxBi2jYPFnLyk6Ls3jYabbOhvk2/pY0VtMhsQ5Vqy/LSS7Nj
	 dbYBfrnfJDsW4eGRvXHnOW84uzM8L2ndLt+apQL6r0E4ZH1xhfrwHxgF1iYT6B29gXg/i
	 oIgFw85Aa/tMcaJBn+5dVTBaLKh4qNusbE82g79A2CESOCYW1baLuQ8dojYg+6m79UahP
	 rY7h8HMrXCysUSz9kLQh4IUMY72bfRDriF690EifFsTebcltD/D3z0aE93VsC4ZoM+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MLoN/EqR";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BD7606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31BD7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLoN/EqR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so52553895e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757594; x=1796362394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SSLJDkhxBZi21kj3K+IK+QTqg+ejmmv97gXCsdfGk8=;
        b=MLoN/EqRwHMu23duF2BjJaiM8H6girNIxtPhW8PvRoXWQvHIvc3lR55gc5yD51sjB0
         PF6s9XaTVdLma5z/zABtdSUQa1cN5Ugq43mz7Ay3uiNTTNYAxfLwaTXM/KCaUUsqCjt0
         v3NGJIruuatK8eXgMAH+Wjj5cMD2pzN2XduwVuTwQ+hW2p6+q7nYkfrAMY0Nb9KFXnnO
         7KWxvtkBHUJnrn0d25jp9C1hrmbHJ322F5OQjtGd+dRRhUQmC3zsjhDSY9GoUMEyovzz
         bY6fgClqEKAFAbOTGgOZCqTgwPn24I/37SPIIuBqZiwi5UZiQgVuSrIZrJPdtsZ4BJTS
         n9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757594; x=1796362394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SSLJDkhxBZi21kj3K+IK+QTqg+ejmmv97gXCsdfGk8=;
        b=1cBzJb3ySOhtv7/+pwMTdH+9dqMnHCW9I3kNb9K7fxt/XgtKaUTwTPCVgn8AhfEcrW
         74Trv1XhdkAjXtZBTGPXWchXyaEwKf1ky1um2ton5ub+RlX/HkK1EtPIJBSCm4uooMEY
         6IgTRCL3MaeL9z5ghdXVKRi4F4aMTjYIxbXSk9d1zdYGWxNrC7Mb2tAOelrKM/ctSzkh
         BLjLeTl28rfwPXdwNMxmbVXwyE/nsKpWXSEMOjZ8V2OSQwTByV2TgVDyqgUVB8CymQir
         M5Id8alKBB+tFxpyOZeFHQlq+s56XEtwedKfFcrOTn+PtqB5aiOXW5Gqt38RRMxDBwZh
         vo6g==
X-Forwarded-Encrypted: i=1; AL+hErFg9wP8JgXM2n479Kr2LWd4vAG6RRguO0yEMpks07v8xZth1OOygqglrI4PRq5nmnL9X5A63/Mc2cA8WIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uIVqolZt72+6lk4S/Zyrw7we1MjHNb9GFWhptfYKJc+p9HzJZ
	eVf/GJXDYYdNbWVcwDQ0UI9bfeqLqvXptea0As4PV17QNfU4F9AFQLJD
X-Gm-Gg: AZFdTZcABJqtWon68r/D9OU18+sizGDMQteD2y0P+lzOUFax0Cq7PkAEG36xlzVuVgw
	ZLAK91u2QW3Ao5hCb4HgqhxMsIGWC0EGJHQT9bbt7j1xr8Pu83QpSCF514c0GAlz7gbjJe7LJ48
	RrNUSO8LCe71Eo3MYPzIAPljet3xdAo8gs0Vba15vrIgbN4MYikhjIXXQQpAcbBMcFgCQUMQJnX
	0d//x613zE3Yi5rR9feocCO4xzNdlJmOZ6SPTKco7juD+8A88/aJ36piNTLthfDARSUyaaMj/1O
	3nkAUZ+xcWv9P+valLShWS4PmVFt/qBcIYWobmrUvunuzsrwMJNZz5mIewSPJuIvRwaWCzpitzE
	Y52Ufr7l0XeBYJxbDDxvAIZQIUr0NaGMrqqB2dtgSa+Dm8PEXxBgUPQl5GBlyCAIZKScoP8Vxkb
	FE2FlnhN35m9+nBUF/BqD8zL5rcA5WybHAax7v//Ym0oQjTTDg3aQWO3aOdaDgfEbDjbFiczRCA
	OlzNl6LsQJ01WVCousJrPUErcaXwvKvp+diesphobvwPHoX/h/wzkxdgWNL3yHF9cg5nCBQgszH
	XY8Il13YyERHegP9yzDJGT6Frg==
X-Received: by 2002:a05:600c:4f15:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb88923954mr544645045e9.21.1795757594268;
        Thu, 26 Nov 2026 21:33:14 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b3a7sm735501395e9.3.2026.11.26.21.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:33:13 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: josef@toxicpanda.com
Cc: James.Bottomley@HansenPartnership.com,
	andrew@amutable.com,
	brauner@kernel.org,
	jbingham@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sergeh@kernel.org,
	taherafahimi@linux.microsoft.com
Subject: Re: [PATCH RFC v3 41/90] pidfd: add pidfd_configure()
Date: Fri, 27 Nov 2026 08:33:06 +0300
Message-ID: <20261127053306.3979858-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-cells-v3-41-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-41-bc9095937a84@toxicpanda.com>
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

(I just found that waitid doesn't work with CLONE_AUTOREAP processes.
And exit code should be get using ioctl instead. My mistake, I am sorry.)

> +		.flags		= CLONE_VM | CLONE_UNTRACED | CLONE_AUTOREAP |
> +				  CLONE_INTO_CGROUP | CLONE_NNP | CLONE_CLEAR_SIGHAND,
> +		.fn		= embryo_main,
> +		.fn_arg		= e,
> +		.name		= "embryo",

Does this mean that string "embryo" is exposed to userspace? (I. e. "ps" output.)
Option is named PIDFD_EMPTY as opposed to PIDFD_EMBRYO, thus, I think
user-exposed task name should be "empty", too.



Also, I noticed that you reset all signals.
As well as I remember, all systemd services start by default with
SIGPIPE set to IGN. So, if you start a cell within systemd service,
then SIGPIPE will be set to DFL, which is probably unexpected.
I don't mean that this should be changed, just make sure to document this.


(I am not expert. So take everything I say with grain of salt.)


-- 
Askar Safin
