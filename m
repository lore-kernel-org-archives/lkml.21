Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695300;
	b=Y+t8gaRNQsm6Mbiu5MRQdusVqAVxHZQ5advDWuz8p+7CNL0iryK4uED3ytm/cye+E+8G
	 fz0/+L6P2DKUut7j0hdX39ezA59dMK+zjAgAsGHBIzPt8uAcL0I/6hZVzUoeg53VnDQ5j
	 272Ys3g+F6if0DemULJHXYZkyT2TkvtPPpHQB2zz5X8J8xdZpk5pVEHOgro5z/Wth7KxI
	 NEop+3BGMNhItzTq2jiHwBjy+NnUkv0yPEtTq9ldV1YFIKr0wifuAxiaoIjlqKHI+RWDm
	 KbqgyDs49zPLT1HlqH++8RdXAY3YKfeLVWfqZlZZEvhGpCTyiGRHQ6L+ys+MXF4otjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=XCVZxwPpgvCRm6fFYl5Jvfibq2GfrDdmfWffaFs4sZg=;
	b=BN83a2aUhKvw+UgMwERXLdh7mdRQiMnXYNpPF4xD6/7JrV2GzMH9k1457sVyI+ARtDYN
	 8xtKpXmu8aUrSPqEO2Q9ut7EKNMSpuit9OeMd0HiIJ026Beog7BuqdLJAkWuYLG/ZOo/Y
	 i3h7lkU9qB0YhxEPKOq2+O6LIq52bk6DOc6mSOgCDfhNllnDgN6GsA48NAHcMYD4p6C3i
	 vU+0m3b18e/VhXI11WqQDEjEBXuyo7V896tTrBNw8S1lPAUW+yeZZAO78f8yaKQzvUDM5
	 uE9HM79VAaHDd5rr6zIYU5S4XgOo8yh+6BNtwwTlOvz/LTfhwa8jQ2s+tNCsoGvvzqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qke+h4B7;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5822606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5822606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qke+h4B7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385d8a00598so10218822eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695299; x=1796300099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCVZxwPpgvCRm6fFYl5Jvfibq2GfrDdmfWffaFs4sZg=;
        b=qke+h4B7beZrYv8v3CWSrYutsRK1ufA/ye++MY5GstVXEPad1y2Wdnwe0m5SR8HQ4Y
         rLO9tLA5FP2/433U3UTBDlJHOBIjq77WCJwOkOdte69VNYxCy2zMAaJ9XoZ7ESZrZsIX
         VtTUXVPhUdytgeCbqMkNT1hVT/4LNjptJXIwvLyhvI1fkFm3cyYLjl7edZvA5pZaqWbq
         AsNZWeOPwFZ8eo0Xapc9DACJmq8qx4ftXs6KPpbJ4zJNG6UVviTx85CRHG0DFEwf9QUo
         H5kZKUDpfGXwNKFo5ZjBnm1jdIx0jMAXa8TSwUGtOM8P0q3SWpeQdwHQlvhDROnEkkbu
         ClQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695299; x=1796300099;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCVZxwPpgvCRm6fFYl5Jvfibq2GfrDdmfWffaFs4sZg=;
        b=1I57AZcAUmuihwvRiBMeXmNVJ6FCX/HzD5taRQcwINhI6umgA/rLi+zxjG8tsiuw3K
         uHYYublhp2i/tOB8VcUuK5M7bBiZX3wkwHgjvgS5PKKiFLdBn8nCcm3YKnNgEYZ50PPJ
         xbweRUVKeqS68aPcbNNCQIVcSm715fRTTZBN0U3NHWVVjciT0JIuwcIGaBcix72p5lVY
         rNGnTnaIQB85UnDG/e2WExUVfmqii8qxMzTWrhWZTD0DOXbC1d3VZThqL9wAD78BXGIW
         WFGxj0Oz6rtO5J+vONoRIK5UMfE/fGsuf+ieLOouvvt7EKAfHYzJdQzHcimGOZpQ3Kas
         tVjQ==
X-Forwarded-Encrypted: i=1; AL+hErGFE0qBX53Sfai/VE++u2CY2z1Fe4+3J5zhPuDoLKDvEzaXmJYxfLkjxVYIkMsH5xQRG60J7ATrjjAJKoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9juzHkw/uTe+D5Jypyc+LzhH3dIQy90fow+IIizlnQp/z/Q4WT
	Mri/v4sasGCFZfV++nfXmszVEThaEyUsfDAwH/bRqBHQ7wBbMhdVny5e
X-Gm-Gg: AZFdTZdlqe/TPsHFWXAEeIh55Fh2JTyX/TBB8+WL9xTcXNpdu2ZiVse8WDs+Zco/Mu9
	ZnZjnaZbScEYg7qapvTHJkxiNSLFbJOrCuY/kZt2wrb81eLfZS98t7GMq39ZsYmdc55vb8AxwNu
	mAQS/f4xzde5pJN9MUOAVzprgyMdBZBHea9DHC9sJya4cPcNUHR21mHUYkXAL4gU1KIM4KQnO4F
	2SjoMR7zxAxYksf7rYJQOQkYS97Km9EMx7SsvHynviBeLNFAvWhX1G56AN4xrz4NFVM93EF+zLu
	iAvTiv5aDCUmyozAbNMhgK/XRf1LHaIHiOYd9Yy2N6GjoQ2oTnXOIaojr9VeVV0uSA4NkFI6d1S
	MSDcg9dTY35A/qQ5bPlE08Q06IRrwyE2GC3xN9SDycUtngfYFH2TdWKkFtWriefyKm6JuTfyIO/
	4Tr4vK4J5B1RNu6bwED4k+99YXGPr0qDWgBwzb1A5xOnF2AjaOyVbO96BgeE+FICvlTW4onoTjf
	qSr0NtyBZRZDOkoUSP9jXZuMFNw7LBVkfv8SxIf9PP1OE7b5X2yFAVrjK/omiyaqhajDdqb9ZHD
	odoiwGOe739Ehj8cQX/cnrYxrZSFVkT8Of+GjFhItIIjr6AwCR6rtoTFH4Ov/g==
X-Received: by 2002:a05:693c:62d4:b0:386:ad86:21a9 with SMTP id 5a478bee46e88-386ad862c8emr12324340eec.13.1795695298917;
        Thu, 26 Nov 2026 04:14:58 -0800 (PST)
Received: from HFGF46V04Q.bytedance.net ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm59109818eec.16.2026.11.26.04.14.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 04:14:58 -0800 (PST)
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
Subject: Re: [PATCH v5 02/19] mm/swap: clean up hibernation error handling
Date: Thu, 26 Nov 2026 20:14:28 +0800
Message-ID: <179569520640.49764.510050912247709774@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CACePvbWzE6AvbLzNFe=J5Vid8iy6FFQh0RBgr+V_jJJ4p=OEVw@mail.gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com> <3e8d55101602d5ec982ae636eaf5eb4dcaad3ba8.1795439990.git.lianux.mm@gmail.com> <CACePvbWzE6AvbLzNFe=J5Vid8iy6FFQh0RBgr+V_jJJ4p=OEVw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

Hi Chris,

Thanks for the careful review.

> Nitpick: Here "ret" only carries error code. Maybe we can call it "err".

I'd keep "ret" here since it holds the swap type on success and a
negative errno on failure.

> Nitpick: Maybe "unlock"?

Agreed. I'll rename the label to "unlock" in the next revision.

Thanks,
Lian
