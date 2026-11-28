Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795828227;
	b=wWTxtqqExs8HT6270fVjx1nVTLJMHmhK9sw7RwwfNPSmJPo79Jon2fJVoh2hcskyZll1
	 5hWlfblnKFWmJRfZCP4/dxtB+76Kdm4Q1JXoWFVg9VcAQvA6g24vyBjbX2URCXTgTEH53
	 GWrzgtH2zjBHpB3WJf55H3DB7Ui9fVRF63/N/HIjzE0vlRF+QJh93Ch/2sWH8npdW13+N
	 GPRTnNvTHQaDMrjGvPOSW+O0zWtlqR5Z9SD3deap6fLhXaSyKo1I1PqES4jJ5h4fgJNLN
	 BvYB07HBiUBvmm0LlvK6LluC5+LH0JchjVu02B6qKy4ibrLlEQ0TOipk2iKGOSBYzLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795828227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LCoNBWE3kmGZQJ1kgw8zMrA5EDN0aulmwFxsRmULwsM=;
	b=Ia0v7UolTgzjQBUNOLLZFysFAV0xAFIaPcMPcPNe3FMVk5rMk3bF9iv9PO6fT/qGJrzp
	 CYszzMhxzwMio8nV8iY/IIkJeujCkiayoggrC76p2vGqvQ2pca4wUiscSrMnk4mJfO5zP
	 wkGJSmL21y1TOfKvviEWO1LaUHrh2n6QlDP4zfc0cPAB9YCeeRFCjLjoMB38PIuRLVBD0
	 7FUhLtv800OgRTU7lG7IMy3pz4QbzuG8c6/2vb2eDTcL2dxnpnFOGVvRGfZa3ihMJkaBD
	 DG3V9Z++XYidLyjLBh0fa9ELtvhzku0emKnnx5/4I2gnAEGTwZVXNlHNX5epS1d80pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.cmu.edu;
	spf=pass smtp.mailfrom=andrew.cmu.edu;
	dkim=pass header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=CWjYKGT0;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1329A606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1329A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.cmu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrew.cmu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=CWjYKGT0
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5365d725440so76102561cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.cmu.edu; s=google-2021; t=1795828223; x=1796433023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCoNBWE3kmGZQJ1kgw8zMrA5EDN0aulmwFxsRmULwsM=;
        b=CWjYKGT0Rxh7o04L3TC/JfK+uf4hcTv5G/OYgTRB1iBdL4eDH3e/LFFIDSlMTSh10O
         nTeD3sJ2hsdOj+qUENGI6sv3VZx0OdZm7gaYArds/UnZMFzu0txNbil2P2V49E3BSbKf
         fBFWYtcAxrxOXqE8cE3CSJ7ayej+C8/WOWoK8p4TehPSmjK4cVdj6nW4QQnR0rVwFURz
         FQHMbeQFo/sRs/DRuW4xea47NphJ6VklMieXOE0gjy6FzMga+PUhUn4yGX9iJcyWCFRN
         dHlM28+px1j6+Lb66EZ6+U6goVgQsWG0+7hHxkb8jYPOwUJKOuA9bMOR7OUMQNy1D4tO
         ehCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795828223; x=1796433023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LCoNBWE3kmGZQJ1kgw8zMrA5EDN0aulmwFxsRmULwsM=;
        b=w9/gvKeQezCSnTF+8GkUVwsvYF9t0AMKhc+YQjpKyNPFCUlYgflsd4FTeJd7QvYHUt
         hkmJvn3q9vGQ4zjqGfNu9UIqn2y6nmPC20Xjnk2T+XNh0fmF/LvC9Ih2r75Pb6h0m31H
         l9yDUtwmObIod8ky7VtDrKNbZZ8FKVdh47B+X3Bhb6s3nTi2dqV/jDHfyVPQJ1T6Sr62
         M4pW8zmYaKRjKOrRd+uFEug8NvcnwGTCZpMYUCd00+kvt1fQOoGiWN8CELSoqxgHwmmx
         0DC5XzoDHfAGJVfbqoBbxglzKziQUjeNoOaRgiIAZIOJwsI8SGbWfYekTs95miwDdF9U
         slPw==
X-Forwarded-Encrypted: i=1; AL+hErGeGKF/Hwo9mPLegZy+b1wzwgKpX4G+Old2bX1xR70r5bByDgrLT+CHfLAPaJrAqQcuk7tZnRQN8ziA/G0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bIX27G/SgGmawUkqx+IGEKiTKfoVkW/WovTXPJfdrwsvLstUC
	NpyDfw/qMG9DuZIzFKYQbT/cAjS/WWPcgia7F3AYgP6C4lNZkd101mB06pLdUnr3GA==
X-Gm-Gg: AZFdTZfnMOKMuBTDmemQ/uCviW4crALXACe09rQXRBsjo0rylmYahbI9fCdPswaPW03
	Vnn5HrT+f0x72CSeWEOxZK1xbNvWjxYc1CVbK075CLU19o9GMV+f7nJWZQyIlxrCG8B+XSl7yjA
	hpcW8oujjr0U0nY70eSveDGxfVIWSuHewhDir5rfhMg1FzhYRBDLb6Vr6XROl3teuclkn5GZ28Z
	f7TzEglW0h+CbVq1jTxcWJfY1YJKcD1JxpS/IcF7ZQmcUisunxa3nyTKxxHkyurHNCt3Gny0EYW
	MERj2+Fw0XvctIUf9sZeA+noosO3Wtm0tCpi4Vex+dGa9xmOXhw8uwremtx3duA8vwOMY8+/XUt
	H8bhXfAzRIyIjybe4jQL4C6OqCy52XtTXoud23tNRmes/Xe6C+V9QtQVZ46T+5ld6TiLZ9MOXJg
	EPw/eIKQpg3XxZXdF5RVT6qGgb9mUmND5wiLLDYDCa9BY/2cbrZD++MLmKxjw1oj7CCiSFpEWFg
	lQSmguNJMkMAPaE341VtOv2BkSrv2Jq7SAfg/BTSWmuXJqyg3kQ7Cpply4XarAvAYUbd6gVZdDk
	7562riprO0UijaRCpgX5wu3ZVfUL89ER/TVtMcTJCaGk/NcKug==
X-Received: by 2002:a05:622a:428a:b0:535:f92d:5c00 with SMTP id d75a77b69052e-55d76af8921mr488959251cf.76.1795828223013;
        Fri, 27 Nov 2026 17:10:23 -0800 (PST)
Received: from cs.cmu.edu (tempest.elijah.cs.cmu.edu. [128.2.210.10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b3a0csm229263356d6.14.2026.11.27.17.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 17:10:22 -0800 (PST)
Date: Fri, 27 Nov 2026 20:10:13 -0500
From: Jan Harkes <jaharkes@cs.cmu.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	David Rheinsberg <david@readahead.eu>,
	Hugh Dickins <hughd@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>,
	Alex Shi <alexs@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Pedro Falcato <pfalcato@suse.de>,
	David Rientjes <rientjes@google.com>,
	Rik van Riel <riel@redhat.com>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org,
	Andrei Vagin <avagin@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/4] coda: never point a file's f_mapping at a
 container's mapping
Message-ID: <20261128010821.irhzl7qcqahz6onx@cs.cmu.edu>
Mail-Followup-To: Andrew Morton <akpm@linux-foundation.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	David Rheinsberg <david@readahead.eu>,
	Hugh Dickins <hughd@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>,
	Alex Shi <alexs@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Pedro Falcato <pfalcato@suse.de>,
	David Rientjes <rientjes@google.com>,
	Rik van Riel <riel@redhat.com>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org,
	Andrei Vagin <avagin@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org
References: <20261127-mlock-madvise-mprotect-ai-fixes-v1-0-e46b2b1eb435@kernel.org>
 <20261127-mlock-madvise-mprotect-ai-fixes-v1-1-e46b2b1eb435@kernel.org>
 <20261127124428.f1f66c6244d3e5c2811f56de@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127124428.f1f66c6244d3e5c2811f56de@linux-foundation.org>

On Fri, Nov 27, 2026 at 12:44:28PM -0800, Andrew Morton wrote:
> On Fri, 27 Nov 2026 19:45:40 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> 
> > Coda file systems stack differently from other stacked file systems.
> > 
> > On mmap(), coda_file_mmap() switches both the Coda inode's i_mapping and
> > the Coda file's f_mapping for the mapping of the container file. This
> > causes two problems.
> > 
> > Firstly, the container file may not remain pinned, at which point this may
> > result in a dangling reference in coda_file->f_mapping, and so a
> > use-after-free in mmap() or lseek().
> > 
> > This can happen when you open the same inode across two files, mmap()'ing
> > in one, which assigns the i_mapping, and open()'ing another, which assigns
> > that i_mapping to the file's f_mapping, if the cache manager gave the two
> > files different containers. Each file pins only its own container.

Coda uses open-close consistency, so between the first open and the last
close the cache manager does not make any changes to the cached copy, so
every open is guaranteed to get the exact same container file.

Now that happens to be the Coda cache manager, I guess changes that
would enforce this at the kernel module level can be useful, but
dropping f_mapping, I think will break mmap for us.

> Yeah, I hit this while getting
> tools/testing/selftests/mm/memory-failure.c to work on all Linux
> filesystems.

Did you test this without the actual Coda userspace? What was the
cache consistency model your userspace was using?

Jan
