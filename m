Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398721;
	b=Am5MsBfaDdnEV2QB7qUaDs51pF90AJNX9a95bJVJEXhTfGh54G0T0k0woNAM1uk2Jox+
	 11GtJ7mDMkWjoGT53xfkcvJc6rB3FNkXZSasMcHO17FfTceixuplu+6rheCjeZqNsm8iD
	 Zd8grAHN8Np+3G1r2EhpGt5eORLg3rcMIv9+bk0GEvLZsu4PQp38lQU+NMC+zmUi410jw
	 XMIWcs/JKPUd2nWk7P3cRpCBgp0Dz6vM6vo02G8VnBlo6bA085S20Z1DeqXGzcaP0aYBn
	 qemrnZ0pQ02U2ZURd72nwVNApXIFqcbozXA51S2oZkhxHksk26Rar7dhKfXEAjpICxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398721;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YVtyufYB92pslMYc1cNPbAx48nCwMK6/elZbLI4VZ4c=;
	b=P/m+EtjRBo908afJIA8rTnAUV0xEXi4ILTS21SEdH+jb4XnZv5L2JebmjaCalF3soVCs
	 HENoTB7H7ErFpvSDzY4/NrI8Z64yM20I69TezdBgBy9h2badaqSEDop6f2Ogt8rC2Wtvk
	 CvibkXmV+1ObYxEkFoEW0HH5xbPZwDpK9kzZH1VmpBrTpiLeczMsRtkgcPdC5PqT+rKHT
	 pAS4atc9W9NASZwOubkr0131hAEy77g95rfMPl2hag6++Eo/Y+BJU4OSmJkQ6mJEZ4vn0
	 +rT3gmy7QThWkN5KG7JIsyl4jmngKbMHy2dOzhf+dwyaujAt/+VWxeEWnfzo8Fnq8Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XJO+XIkm;
	arc=none smtp.remote-ip=95.215.58.77
Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C94606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C94606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XJO+XIkm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=e+QHWbBPMWAeiyatS48Y4WE7Tii5hCDimKpeiM65Zg8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795398718; v=1; x=1796003518;
 b=XJO+XIkm3rkM9nMrQaJ88DBU/SbDNDS8sX/2dIaj3cwmRrKirwqyb+I0+uhLyek6+NMpIzpi
 feptrx/ngiR7GStYVclrJX2X302KeSUwM1np0LDwreiaO4CnEGlTK2BETzp5dn6xGe4YcTGokd9
 xsy7UnLpMsmmUcjbVs0s4weY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1054823f21723493;
	Mon, 23 Nov 2026 01:51:57 +0000
X-Mizu-Trace-ID: 1054823f21723493
X-Migadu-Flow: FLOW_OUT
Message-ID: <361c4312-f77b-495f-9ee4-e0b9612b4463@linux.dev>
Date: Mon, 23 Nov 2026 09:51:41 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/8] ext4: Add dma-buf read/write support
To: Christoph Hellwig <hch@lst.de>, Anuj Gupta <anuj1072538@gmail.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, asml.silence@gmail.com
Cc: Jens Axboe <axboe@kernel.dk>, Sumit Semwal <sumit.semwal@linaro.org>,
 christian.koenig@amd.com, Philipp Stanner <phasta@kernel.org>,
 Dan Williams <djbw@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo
 <ojaswin@linux.ibm.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Zhang Yi <yi.zhang@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Li Wang <liwang@kylinos.cn>,
 Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20261113070621.273953-1-mengmeng.zhao@linux.dev>
 <20261120154153.GC28611@lst.de>
From: Mengmeng Zhao <mengmeng.zhao@linux.dev>
In-Reply-To: <20261120154153.GC28611@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/20/26 23:41, Christoph Hellwig wrote:
> On Fri, Nov 13, 2026 at 03:06:13PM +0800, Mengmeng Zhao wrote:
>> From: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
>>
>> This series adds dma-buf read/write support for ext4. The dma-buf direct
>> I/O infrastructure allows dma-buf to be handed to file I/O as an iov_iter,
>> but currently it only supports raw block devices. To better serve the
>> GPU-NVMe direct access through normal filesystems, prior work for XFS has
>> been discussed at [1]. We are also interested in this field and working on
>> it [2].
> 
> Can you an Anuj please work together and merge this into a single
> series covering both XFS and ext4?
> 

Hi Christoph, sure, I'm glad to work with Anuj on this.

Hi Anuj, I'd be happy to help pull our patches together into a single
unified series and send it out for review, if you're okay with that—and
would appreciate your review once it's posted as well. Please let me know how
you'd like to coordinate, or if you have any updates in progress on your
side before I put the series together.


