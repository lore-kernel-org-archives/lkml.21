Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520061;
	b=CE/4A8ohIH5FsFHp6Ba3W8dVW6r3dgJA/YbHdVFHZXMjUEjCWeq+2knELLwEd/OdbriY
	 rLUssKrb0ODl5A/LQQqKpXB9XuKFuTU60hvMLU+bNM8B3pMPzdItiLQm1LtVvKN36VON0
	 QYJmcUq76Bpf4dW7165xEMoLZ5Cr3iiLjZMnJQ/knQMJQqlmZ4F9QEcaHjgjGl8BCl7rn
	 1F9JzL8NtdCSUB2zgWDgKlzR4PgaRUfFx6IgYyshriUEPVLLsU3FzAk9VLu+Ita8cQBTP
	 TeAqntOZIMoj6/gwAJJqWqW9DjQDFeN6LLFzB4uskclb8N7OxWXShjMf+7BoFNa9jZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520061;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=m8Fzs925Xr4/4DIBabyECw/hUQw8zIv4C/h21g95nvQ=;
	b=UaRwpr3MPu/2zsazegvo0TvR7ZaNJqe3K3bZyPkpUmL68JxGX2w3jBJKBaPa162SMNCC
	 QubxmOVUkrrUakHSwMW2Z5K5xG2E7Go3810atP4RWT+BbFTNCQ75GSrztS1DMjNYdTQZk
	 sqicI4KL6mO3GjNR8iiGqHrTZ3eLept2JYanW7+GGmM5VauwnrG/MKbC7fIdSiju1Vh6R
	 o3/p1ZjBAxAKCq1hed4qHqntlN1WVu7yEZcrO6tmCKd5HCDy7kmD3n+igyUl1eop1Uiar
	 Ma+/DtPuiQUzBt/Nn5HN8yfoCd5A0DACWvw8Tkg+R27M0xH21kPMwMT9pi//gCAIR1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdRjt4Cd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XRkdCCuw;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF661606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF661606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdRjt4Cd;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XRkdCCuw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795520059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8Fzs925Xr4/4DIBabyECw/hUQw8zIv4C/h21g95nvQ=;
	b=CdRjt4CdmQdWlAg6g7HNKf1gLHn9OgPZAP/PIns1K/xoukXPXsL1EDBZzEIkYEHuCTX0pG
	9Ip2onwYdbqwgSPqy1Vh/TXVXkl5I25XvGZ1VV6mbkGbKen1ddALsGtU4cnOYh/dDOkw6Q
	2ExksMjLFQYD+SG/5t3qljGvjk9zxvs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-vltcRMoRMb6ztnQy7gWG5g-1; Tue, 24 Nov 2026 11:34:17 +0000
X-MC-Unique: vltcRMoRMb6ztnQy7gWG5g-1
X-Mimecast-MFC-AGG-ID: vltcRMoRMb6ztnQy7gWG5g_1795520057
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so1111553485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795520057; x=1796124857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8Fzs925Xr4/4DIBabyECw/hUQw8zIv4C/h21g95nvQ=;
        b=XRkdCCuw87EOb9837lr8iXSna20nBlqrT/MVq2g54ZVKvApYDUwAGeIiPhrEfdfNr3
         RU1FDILE8sjV2+5vby+0m92Ztw49gS+8N+1YjghSmIcOSCu/ut7V39UxuO7gtj/2Q37n
         KHAGb00FTSyni6sYGyukaMkUg0R/S+ZNzBXV23RdAUBlDiw8BFDaLZYAXYJtJ9rLpbL2
         4UuZcVZ6b1gn3ZtmLcto/eSQsCdfbA22yxQSiocCKwKp60JxnFPpqVa8D8AXN+Mt0t/2
         kC2Tq3o9fokFYjM1XAQ5b91o911tqe97toZbSzM1ZWNT46xHG8TzxFMPHVsnKWzt02jq
         k2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520057; x=1796124857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8Fzs925Xr4/4DIBabyECw/hUQw8zIv4C/h21g95nvQ=;
        b=H/C/cYKIdMQBERRV7VRl7bWH1y0/HpSUySXvWuwVyN8QmBQ/QyqHW0rAy4oj2gXzNU
         lg7zezgH+ljYZgqAm7UTscX4D8xqwqUe6c4w5aiVMY0QmwHMC2PIlAJMVafsJqRTivF+
         NdpHiPct8K458YdLKVz0efJ4ZviXjIbORCy8dxBs0iDkZ1WLawd6dhRoqXHJuy4+hgYI
         bxxYWt0dy5MDWSWtmVZalQVXrDbF9DGIruWhtsyzFunr8MdHmqXLByqTcP8diNMMS4ri
         K7Hv6quZCc6hJVKapw0PH6GW9mJkbMXV3U/ahsNGXA4AZHsIqZ1S+yixrG+C+c8ECbTv
         0Tvw==
X-Forwarded-Encrypted: i=1; AL+hErH6MNNxNrvPYhinr+aqPQNDV41IH4OB6MYWv3uD6ZYfwj+pqcO2H6XP339MVrCok7bzyJYzViQYrSBabmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NSE9Am78OgiafjVOc6wMkzl2V+5JdIN+o2yUH/wvfhlxs9F4s
	cpjgH+8izO9vRq3bq6/hBplSi8LU6+akoV26Zqww/ChjAsE/4NqlfJn/IP1BLZhrBkuArZgCnvJ
	deQopHhM/vnRL76VbZ1ThfWcQzFZYhXvjDYSedfui1gYA7HYyQM1V9DyirWEDTZIpMw==
X-Gm-Gg: AZFdTZcxMY4J1EoZEeJ82V0R81oZVt5YQCRqOmiuTVQsosCr3MTR0DWyQypF7Mp2IfI
	97ieVjS9ucnnSrSvYtDw4rJnvs9kDcuM5jRSOjw8fam0Arq7X7Zn25I9pcDSE1+S/mRt54AqvR8
	5Ua5V8qCAkE2dVRMN3DKZgth/gChIbePTz+hMvEyl7bLe02n2d/jszQvpnbIINZYUzH7CDVHwps
	QF9Sf1/i7FOdniGLrCCilNwaBT4d28OdodyO/cLfXt+8+IbFlPivDDYoI/eMdEsL9agOrFzLp9R
	YMWeswH7bhHPwei8WtGIPa4O4/ktP3yVzk9/E6QLNd5+fzuwvmxULyuNmMsnLCddnWdCeb40nfy
	efQ4dLonip+orcEg5uQCeakDPfKDWZ0/YhyuJFY+fiDbm0CklkBTzpHSOONccg9VaguOUadAX8b
	vrv0njDGuKRhLd05ZR5248jrI8ROklpU+frLn8R0g8xsMt4CvF0FeTDYEy+NyIkoUOSzxcsB/KG
	WshxRqUnqub3qiuqJq/WLK1hWWrGf6Ys8f85rxG1ftZgKjVhFKA
X-Received: by 2002:a05:620a:44c5:b0:949:a9b4:bd11 with SMTP id af79cd13be357-949bab4d986mr2487712585a.73.1795520057222;
        Tue, 24 Nov 2026 03:34:17 -0800 (PST)
X-Received: by 2002:a05:620a:44c5:b0:949:a9b4:bd11 with SMTP id af79cd13be357-949bab4d986mr2487708785a.73.1795520056784;
        Tue, 24 Nov 2026 03:34:16 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34d427sm999811385a.9.2026.11.24.03.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:34:16 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Kaho Jiang <kj2864@nyu.edu>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Xiubo Li <xiubo.li@clyso.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	co+408fcc361565713f@bugs.sh
Subject: Re: [PATCH v3] ceph: Use unsigned types for snapshot split counts
Date: Tue, 24 Nov 2026 11:34:12 +0000
Message-Id: <20261124113412.2078323-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123050440.223436-2-kj2864@nyu.edu>
References: <20261123050440.223436-2-kj2864@nyu.edu>
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

Hi Kaho,

On a malformed SPLIT, the failure path calls ceph_monc_blocklist_add()
with snap_rwsem held. If the blocklist command succeeds but the subsequent
OSD map version or map does not arrive, cached snapshot lookups can remain
blocked on that lock.

After the blocklist call returns, ceph_mdsc_close_sessions() can queue a
close request and wait for it from the MDS connection worker that is
running this handler. The worker cannot send the request or process its
reply until the handler returns, so with mount_timeout=0 the wait can be
indefinite.

Please move the blocklist/map and session-close waits out of the MDS
connection worker, and avoid holding snap_rwsem while waiting. Keep the
client fenced, prevent further stale-context submissions and account for
writes already on the wire before releasing session authority; retain the
required references until the deferred cleanup finishes.

Thanks,
Alex

