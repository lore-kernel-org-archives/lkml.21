Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.0.225.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659787;
	b=w+LQd/tEPO79BpKQ+7Cw7XbrF/LEnwijsal7gB97HZHUn2uAhCfUJSY5uVZNLp3vhkDB
	 vHvGE79I2zuoExMwLPzDn8+PYirgtfS1137nIxXjJ321RjraTR0i6cd4lsSu/Wlz0DVpC
	 qy1dGDQtSfN9NYEC0+/fRavOZItx88M1xIriWKAzt+WBX+n9LJkiCt5H2YA16vrr/pfwz
	 Pe13wmT0Es9cWRmnnBJ9LFGivLyuQEBNQBufOKqQcB0LJNWyqabcOGiLd4OGlhNDGgzhu
	 7VJ070KWM8oNUvS99KFaWQO37AT6J8heHmvE4U8Zo7BwLpGa/WjDnBGPUn18JKkj+aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659787;
	h=DMARC-Filter:Received:Received:Received:X-Eyou-Smtpauth:
	 X-Eyou-EnvelopeSender:X-Eyou-From:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Eyou-Sender;
	bh=Ri8aUWGj+gFpVZhXpXUT8xBhhEuxSbbaiB3NQCc6Qlk=;
	b=I//I0S4+iGBYRl0ZzcG7pqEkBRfFSmutLj9BQdwEK2QRMH8PcwpU9aUKCTdsEOp3lBZV
	 SuSDodg3igeFjwZjf8n8DKawxjiO3M3cYrfcpmRMiAhIO+1ypxs4wK+ipFEQyOMVrV5YB
	 vkuALMEykGYaNM7ATzl1Bd+Go8hxwyWJZhzhASa4AthQ4/JpotfxE3/5Q//7Vx0WjX9Hd
	 qBFej+q5+Bf5zeMJJE1T6fjakKpztkE+uHlifbr1/TcQUstuVPEEs1OpCrUxsyX6MONFU
	 0B/7xLSNRUE6c63seBPLvWaIp8zm++reyrrULV417cdJks8BYBOSiCRycSr8NB0x1xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zhaoxin.com;
	spf=pass smtp.mailfrom=zhaoxin.com;
	arc=none smtp.remote-ip=210.0.225.12
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19052606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19052606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
Received: from zhaoxin.com (unknown [127.0.0.1])
	by mx1.zhaoxin.com (MTA) with ESMTP id 4jZgLn52xjzbKS9Q;
	Thu, 26 Nov 2026 10:22:57 +0800 (CST)
Received: from zhaoxin.com (unknown [10.28.140.201])
	by mx1.zhaoxin.com (MTA) with ESMTP id 4jZgLl1JwQzbKS9Q;
	Thu, 26 Nov 2026 10:22:55 +0800 (CST)
Received: from zjh-os.zhaoxin.com (zjh-os.zhaoxin.com [10.28.44.129])
	by zhaoxin.com (8.30) with ESMTP0c6d7756cda0e14222fc074603a8512f
	Thu, 26 Nov 2026 10:22:54 +0800
X-Eyou-Smtpauth: jonaszhou-oc@zhaoxin.com
X-Eyou-EnvelopeSender: jonaszhou-oc@zhaoxin.com
X-Eyou-From: JonasZhou <jonaszhou-oc@zhaoxin.com>
From: "=?UTF-8?B?Sm9uYXNaaG91LW9j?=" <jonaszhou-oc@zhaoxin.com>
To: akpm@linux-foundation.org,
	Uladzislau Rezki <urezki@gmail.com>
Cc: JonasZhou <jonaszhou-oc@zhaoxin.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	jianhuizzzzz@gmail.com
Subject: Re: [PATCH] mm/vmalloc: avoid false sharing with drain_vmap_work
Date: Thu, 26 Nov 2026 10:22:48 +0800
Message-ID: <20261126022248.93889-1-jonaszhou-oc@zhaoxin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825104659.100134-1-jonaszhou-oc@zhaoxin.com>
References: <20260825104659.100134-1-jonaszhou-oc@zhaoxin.com>
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
X-Eyou-Sender: <jonaszhou-oc@zhaoxin.com>

Hi Andrew and Uladzislau,

I see this patch is still in mm-unstable. Is it being considered for
the next merge window, or is there anything you need from me?

Thanks,
Jonas

