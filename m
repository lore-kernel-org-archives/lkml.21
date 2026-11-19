Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080235;
	b=q/X+8kmKyxbnd2hNxZTMbsx+CzQZ1sbpB14zWZ6B1W7UikeLMqC3tkubb09ZJ3V0KdGC
	 9ABRU5+L71z+/xCajghJfk4f1x4qlBc/P/PMOmlVcLvYf+SxW297wj1UIrCtVcRSTa+zO
	 nHxkNNeuC+5gSK2JliJ0eYT94tFT94ZFPFPGIwnemo79go0r5qMGrUV2nqkJhrd29aS3I
	 kX5tnJhU0uidCFHfT6SK/cBVsQmRw0pk2jFEee9+dzI1CgDY1SNzO2i1VovzJj6GzYRXR
	 PWVzLcyU7BwwslsB0HudSUEKG/Y0UAKajlWHRdu59MhZwaTQH8x76H9ggVmRufdKN6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080235;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=8BbZkq+DmyFDYud+in+NzZnjvISsdRt+bXMusCvgfHk=;
	b=aRSas3VnHszX1vE3xMkWgXxDsX8m5YCAxvm3YzBBlvuDi/II1Hknq8dPFo1RTrenwTPw
	 JGfsGbjVPgRwPnBUwx2UGq5p9xfB34KzCajyQZqhP4MpocIvQGamn51WfEEUUw1EN37zA
	 6L9huRlwG+prAkDUtCj4WrB8t/LY1K923IQJ3vnpa5dzpWid5qJefll81kNb2mI80G2Vt
	 UFrg+TXk8Bcbj9GE/cU6E/BakEVVo5izYG8H83HZNwBT16D8Yf3MJaY4c34w0B5XyHWfd
	 3ryiVZneSPWGCQDyOBsoHLStXLVV+y6DPJaKJnjBuo2ARXcV7eviXscaV8M56oMsmRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=MjoeKzAj;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07289606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07289606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=MjoeKzAj
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8BbZkq+DmyFDYud+in+NzZnjvISsdRt+bXMusCvgfHk=;
	b=MjoeKzAjt6NTNI1C8Hfiliqm/LHebpFMg2BTpiBkAuHBOlFsqKLJDpaAYAhOv2sEa/6eTnntA
	opOGiCj4OVATWyDQX8KPLumcQHGY0SdCrGDSzy9I91p9fY70O5JUgs87YGWgas16Gql9Ub8pAgb
	5E23jIqpglwcGzZ79aTvDbY=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jVY183phdz1cyQ2;
	Thu, 19 Nov 2026 17:23:24 +0800 (CST)
Received: from whupemk100004.china.huawei.com (unknown [7.152.185.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 03ABA40586;
	Thu, 19 Nov 2026 17:23:45 +0800 (CST)
Received: from [10.173.125.21] (10.173.125.21) by
 whupemk100004.china.huawei.com (7.152.185.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 19 Nov 2026 17:23:42 +0800
Subject: Re: [PATCH v3] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
CC: "Huang, Ying" <ying.huang@linux.alibaba.com>, Kaitao Cheng
	<kaitao.cheng@linux.dev>, "Garg, Shivank" <shivankg@amd.com>,
	<vbabka@kernel.org>, <ljs@kernel.org>, <liam@infradead.org>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<nao.horiguchi@gmail.com>, <ziy@nvidia.com>, <wangkefeng.wang@huawei.com>,
	<tujinjiang@huawei.com>, <mgorman@techsingularity.net>,
	<chengkaitao@kylinos.cn>, <muchun.song@linux.dev>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <akpm@linux-foundation.org>,
	<david@kernel.org>
References: <20261110112641.1196786-1-xiangzao@linux.alibaba.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <6536c6f9-4cab-9f64-53fc-897f3bd9c9a8@huawei.com>
Date: Thu, 19 Nov 2026 17:23:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261110112641.1196786-1-xiangzao@linux.alibaba.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemk100004.china.huawei.com (7.152.185.74)

On 2026/11/10 19:26, Yuanhe Shu wrote:
> The !copy_mc fallbacks of copy_mc_user_highpage() and
> copy_mc_highpage() return 0 after a plain copy.  With PG_hwpoison
> set while the data stays readable, there is no fault to recover
> from: the copy completes, the destination folio carries no poison
> marker, and the poison is consumed silently.
> 
> Check the source page with is_page_hwpoison() in both fallbacks,
> before the copy, and return PAGE_SIZE, the not-copied-bytes
> convention of the real copy_mc paths, so the callers take their
> existing error paths.  On archs with copy_mc this code does not
> compile.
> 
> Measured on arm64, where the fallback code compiles: a
> kernel-space microbenchmark measures 90.00 ns per copy before the
> patch and 90.71 ns after, 0.8% of the copy itself.
> 
> Suggested-by: "Huang, Ying" <ying.huang@linux.alibaba.com>
> Suggested-by: Kaitao Cheng <kaitao.cheng@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.
