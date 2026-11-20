Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141930;
	b=JanUVF3ThZEf4HNJJhzrwv6M6gs1d/pvKx618vta/tyLq5h1CuHPEz84tddZaHSKZUyb
	 q6imThZlsiLD4bTtAd5RQskxIhCRqPGmC90CDA0aAHw4y7dPzoTsrmokPXbZ1dm9aopKH
	 Ng2lKx1Z94MbnZoMHJNAN/DZkKd6IhVCXb6UriVpkIkA9fEJMJxFlacY2ktgh5RmskGdo
	 UEnEjH0bSmPIdBr7Qcx49Tf+135BKmWYvhdQwFE7LwWmk/3GwolLpx0b9qjuGN9xqulmq
	 dpq5nUgHlk2aOuJVUqzJCbjGMYCMgG/EqbLFGh5wubdMoRm0zlRhtryOY6mgktgLmSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pWuIyURNX/lfKFl6nOlQJf4vLilIRP4zljyZSwPK/8c=;
	b=yIQbEvt+BcM6hEnyI9RocVOxSRn8knxdKFMUMBxIqB8egdaDCzz8p8owMs6St9Kf4gup
	 MprN0F+kzk0MIOLnqsZ5eXlYUAyZduaatMNMaO0JHEDvNv+10a/uHcdMS4l31qJKU6DUC
	 fSJA5h5fpy2sM4BPz7TiSXbsdgcmIxbkgvTBjN/spQcqBvPFREbAwIlW2opSPWbnOXLOd
	 vAbX4jQeAp/arTpxqtRy46MQkH5gkI88EGCfp3diNiy4Ehh3gavYrqb0LV4b1Q97ZGwzC
	 lVc9MYfZuyJPSzLo5MNCu0ps1UkV7nxOYmfd2vM7iwoqt/EmyBqe56EXVUO2EZOdg4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wje2tnkq;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8DB606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC8DB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wje2tnkq
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efef1516b5so2123405ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795141929; x=1795746729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWuIyURNX/lfKFl6nOlQJf4vLilIRP4zljyZSwPK/8c=;
        b=Wje2tnkqJdZ3uK4FUrG/JgEz3i8faw+6fym20oxZOBjFnbuz1zOaFqdhodny/qWU8V
         zjJXZuaM+y+7ufQnBaHi6RspEjYKoFpaQ9jFGzhXl1a8toMI6MWzS3uckyFyw5AozALx
         pkWNOIzAbgx98dfSPa6oucS5t22+YxWmgrIjy4m/hmScxYwycC9G8soX2KfMhIM747Es
         F2/MruHxxv1+5es1WI6yjX8QMSB9QHkXgro/z+62z+ywIAb0rPMeFq0+lPZIDgHBfipx
         xleVkrAkku0ADl/iZu4Zk9gHBvdDFPHsGSeKSnnYV8tkvslNneZOr+Mih4Z8NzCIDvR6
         NdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795141929; x=1795746729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWuIyURNX/lfKFl6nOlQJf4vLilIRP4zljyZSwPK/8c=;
        b=kJkbY4qToJjNf3EMfebV3+DRu3l45/BbdK8AbSVq5E3o4QQSwYLmevFlqHBAxLou1d
         QvY1//ReORZjYZzA9RUBtHK2/02zQ4kN1pTahxrbxs+aiP9GVc7oe8YRkktjgtSAD91O
         qqkLKwzDJnOVdvQvU56CkbcIYuHcycXQKL+bHxqlQy+d3x3SdUq9QTl4XT+jA9YWjSfk
         kkFA6f47k4+6oETQ3REwPi4nkV7Z3Yr+67oUjkWQlQZwIh0ANN2VP0vCtjmMDxvXNsLC
         YLLqj5c92wdOCMqOiCWB+2Y/VDlnhKQfGl1nSa4Hesm3+q099xOOncgWreIwl36fN8vo
         zX6w==
X-Forwarded-Encrypted: i=1; AL+hErF1v/6BpkHG63uoYCPC6MA7Uy8Y07z0gEH8dWLJl8fi2Miz0Xi2rWY6bkxkqcfhX9eIp/h+sWsslSjcAJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GC97Qc7Mu2dcHcIw+OOw0cux5EUdVZa85CWP5FJazB2yKwXu8
	WnkoQ/pjrN5sAaguwcTNxFXXpLJdkvtxZsZ1LdFlKGsi+RuFG/e/pwgb
X-Gm-Gg: AYBFou1LkZ6Lw2L6IldNHQKTTlAAqthQbhD9nFuG52jQFtIduVkj94cxVHASejcQizz
	byI/4s8jVj77QLLlgHKy7fSftImI+Y6gv8XLNSackXWATYhuZDExpStbHeT3dsXCOBcC3yfXev8
	gKh2HdFfoqnG/QSIQdMDxld7UTPLpkMJ/3miJZ3mm9SHa++MFYY6YmKxbqsp5QDvPGZw2FQYke+
	P2yFhzs5pUBw5rI9CqkFrDYnIoNi2/qhfldcSZVgc7EEOaquTpLbc2yk3AKXH+6q+LlIRi3Kly8
	+iE2oSJABXz41xMJmqGriO3Iglz2NUrEe/hebLY0K9HSFSoCuhMgfOoGWub0p98W9/2jS47eTTU
	SjHzu5HA2TUnEUAret15Cjqpzcw1U8bkZEiqXBhQGK9k36Lin8KQE990yCIcYjuuztHyNo9yzoE
	vKMNWNjQOLl4DStjnmgPIgkpVIomYUdl1zTNZgG1U2hERP8csr9xcIxT028UVGf/HJcbnAC7uPk
	Ys/kZkkRTt3lQEYWmpGYUNiuV5tmgpBtV//kOktAcIlsm59QiLwhwbie7OEwX7mow3pxF81XnXT
	o9hLdEIjtrhWt7aBPNL8Tv/o6UNqRiKNqMd0zCbZUEEBjJwSDLM=
X-Received: by 2002:a17:903:41c2:b0:2ef:dd60:39c2 with SMTP id d9443c01a7336-2f03f1ead28mr19012425ad.29.1795141929147;
        Thu, 19 Nov 2026 18:32:09 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ad2sm7123995ad.16.2026.11.19.18.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:32:08 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: ah@foundata.com
Cc: Chih.Hung.Huang@wnc.com.tw,
	andrew+netdev@lunn.ch,
	chandrashekar.devegowda@intel.com,
	davem@davemloft.net,
	edumazet@google.com,
	haijun.liu@mediatek.com,
	horms@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	johannes@sipsolutions.net,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	loic.poulain@oss.qualcomm.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	ricardo.martinez@linux.intel.com,
	ryazanov.s.a@gmail.com,
	tim.jh.chen@wnc.com.tw
Subject: Re: [PATCH net v6 2/4] net: wwan: t7xx: do not exit the TX push kthread on resume failure
Date: Fri, 20 Nov 2026 10:32:00 +0800
Message-ID: <20261120023200.133268-1-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106054532.201311-1-ah@foundata.com>
References: <20261106054532.201311-1-ah@foundata.com>
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

Hi Andreas,

Thanks for the report. The trace matches the sequence described in the
commit message: pm_runtime_resume_and_get() returned -EINVAL after the
runtime suspend failure left dev->power.runtime_error set, the thread
returned, and kthread_stop() in t7xx_dpmaif_tx_thread_rel() later ran on
the stale task pointer.

The fix is v7 patch 4/6: https://lore.kernel.org/netdev/20261120015556.131547-5-tim770802@gmail.com/
Its commit message now describes your case, including the remove that
hung in D state holding pci_rescan_remove_lock, and carries a
Reported-by: and Closes: for your mail. If you would rather not be
credited, tell me and I will drop the tag in the next revision.

> One question on the retry. In my case the failure is permanent:
> runtime_error is latched, so rpm_resume() returns -EINVAL from then on.
> With this patch the crash goes away, but TX stays dead and the thread
> retries every 20 ms for as long as the TX lists are non-empty. Is that
> the intended end state, or should something report the dead data path?

The intent of this patch is only that the thread stays alive until
teardown so kthread_stop() is safe; it does not try to recover the data
path. A latched runtime_error is not cleared by anything in the driver
today, and recovering from a failed runtime suspend is a separate
problem from this fix.

You are right that polling every 20 ms for as long as the lists are
non-empty is not a good steady state. In v7 the thread retries once per
second instead, and the first failure of a streak is logged, so the
dead data path is reported once rather than silently. It still does not
recover the data path from a latched runtime_error.

Thanks,
Tim
