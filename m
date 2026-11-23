Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410436;
	b=VkM5LkO/9cu8irRGADfqTJmXmzaZRzCOWqfj1hW89fT6/RktYtus+lOjHJojXYL0Oczf
	 09OusuOCf/IfzTyNeDjnzusHWJnBGgl3bShVVRK8MqRV8/RCAVKNGFgp05nWZaTp3McJY
	 T0K2uCASTjKcn+BE7G6X3NyIDlm6+BmIXahn9Pde3bYGD84lQh7XvlLBTi6oR0MNWzehN
	 qSukgzBdQwaFcj4shI14qk6PHtIw1/l9poQLqsBSl9LcDOlTuuDvC4hQ7zPHrYa1Bmyw0
	 bo2Qsxs/YGOBj5P+fac0x7UacwDVRKVFCVOn2zBlPZPVm+LsFdCppfpgZlaPfkZJRpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DvvWMG387UA/sN7rd1/UF8ygYenjSP4bEmKVrnnLJjE=;
	b=RnM0ryAe2K1LtFDmO1QROupq63o4vAwpMt+0iFH6vUYVSpKqOhS/AvA3H5drJ0Fa3XL2
	 dB3iSB8WS28VGftg51QDNjd6e0sgkf3rul3romf/7Wl1DROiNVXGDzO36hQ9EfogF5aTE
	 4zZwV/rZTN3BLHPtTv1nMXWZ7FREGM22WyjS9sms5cmyZ5z8hw6sltjElXrlRRJuVdeDt
	 geyrb//QbaqL+Rg2jRsAg4GkdZWJrJqoV/tfcJvuvwzP8PK02rD90cQ2slvcHMYf1TU0x
	 G8oASpSghLT7z6z0yJx0SmORQugeng74D9v/T5th5Rqnpiy98Xg/pL+YqqanFDgmyhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTkxqM1m;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTkxqM1m
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3b426133d98so747172a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795410435; x=1796015235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DvvWMG387UA/sN7rd1/UF8ygYenjSP4bEmKVrnnLJjE=;
        b=mTkxqM1maSg9x6wasCbhWlTbN360fasItLYFFN6lCaNr+eoh1yKUPTz9T8R2T0Vaov
         WXYXInL1rN++dZxE8AGCQhv4yEI+//Ua8k7VyXZl1ILd7pq4Uy2IlU0aTZWkL/Gqf7YC
         a8jUeQew7nNjyYzDT/2Y+hX0HK0Fke0kYCYGW/eS8x20yT91r4SdPjQHv6wffyX5kwhf
         vD904eiENpF7Xoe8oZdIFlup30iWpu/6b0KZull+x26ZoMj+uSikDcDbumcZcIL0/8e4
         HXCpQag+FDj2WLQirPUIH7xJNtiPO6JzzsdqZktIjeUEyYzf4nruNMwL0fz3EErteZbH
         dufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410435; x=1796015235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvvWMG387UA/sN7rd1/UF8ygYenjSP4bEmKVrnnLJjE=;
        b=Vh7gvQnvqHR/5OW4PYYUXo3HCDQkkXpfWM/PueVx3QXyy3bmVqx/f+Vr2dCdcLiV4m
         O1qRnr6Ldmv6MYbLXkFhqz7/rQeNsbvITTxx+5mtpdI5VYdsL9Qxva9gQ12Xf5X5z9Pj
         r9c35OFpDlkJgZ93j60747q3kiGJ+Qigz8IA7OiNSHGBLzvrNRfdknmIAEhOTdzuizw8
         dOtLzCTJobn7+ga9xGg0IOV14GL77f3XsuXfnloV3BlvKgW41Nh1hhaYc7ciMrFqbVVP
         1qoE2BOOSPHs9RAUMxPsHaFcUDuf7BJVDZZwnaxK4+VESW2Y6TlpO7+UIVmyUxTzcWmn
         Wqzw==
X-Forwarded-Encrypted: i=1; AL+hErG70pcZlR5iaO8jGhncK7Uu8hp3frSzMg4ZIegegnApGSN2/317PUKo6qXfTo86WT494yyvspXgjTaTE5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XIEHWP8/6Wi6ePicbgB3gGouPuCHaD8QMZtqD6XwlFxRCXJEx
	io2Wyyi09HENBvRtZIKPlH3kYeamvJCENIbGwGtCV2YyBcxyq+R8xvEX
X-Gm-Gg: AZFdTZc287M+DT+rI4BB/FM89wlyANCBOfJzFxqJUknPM2M+ynipV/xssk1Xtt3/c9z
	V2Eqngwx+w1elk3E2qQmMyj5sFXIY75IK2WIV9AjzS3blpemHFQCEWyLVl3tjlKUPLl/JVnTtw/
	OjZORX4kPZCZJue63D74rAUzSwpCNsHrdB3bKKZvK/1GCaf1QplsXZl4ojV9PbbjsOjPVcXd90p
	vDhdRsVwH76AbcH5vyAiCFyalbEoYHyZJkIz3jOhfA+3OPN02LRFcsqLrKyCYCMMJLIG6rMxRNJ
	W56vijtrd7rHHR4ps311R9vVVwQjIFWnBPpQ1chUb7y3lg0DzZBT03E4/MaCTB87zkLuJRZKvSQ
	RHmshxWffe5FZ79lwFds6g14sB2/+y2qj1S67t0CeY4tFg9+2FO78ilzguwjJpo9ktCszHE71Zz
	AHyCOcuesg4Hmn4pK5YQphS7jSS7kaKSBQVJmx1YIUG1zJK/z4DJDeP/K1SinDvJGEEywr6lFHx
	aIgZe8BRyyYXib3hrBNQhWlpUxmps94grMbZXOgGI90CDliz/SsvFgBrP88qH8ZaX0eraQ1ZEbQ
	VOYn/kxYCLASNp+PZG1ugSqcbgQlKo73dnsnDyB75BV7LQ==
X-Received: by 2002:a17:90b:2cce:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b41c9759cbmr9934421a91.54.1795410435349;
        Sun, 22 Nov 2026 21:07:15 -0800 (PST)
Received: from nixos ([220.191.54.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm6438713a91.3.2026.11.22.21.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:07:15 -0800 (PST)
From: Thaumy Cheng <thaumy.love@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thaumy Cheng <thaumy.love@gmail.com>
Subject: [PATCH] perf/core: Preserve the hardware index field for missing branch stacks
Date: Mon, 23 Nov 2026 13:07:06 +0800
Message-ID: <20261123050706.18428-1-thaumy.love@gmail.com>
X-Mailer: git-send-email 2.56.0
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

PERF_SAMPLE_BRANCH_HW_INDEX selects a branch-stack layout containing a
hardware index after nr, including when nr is zero. The generic fallback
for a missing branch stack currently emits only nr, unlike the non-NULL
stack path and the layout expected by perf's sample parser.

Emit an unknown hardware index (-1ULL) when the field is requested and
account for it when preparing the sample. Events without HW_INDEX and
samples with a supplied branch stack retain their existing layout.

This makes the fallback consistent with the ABI; no reproducer for reaching
this fallback with HW_INDEX enabled is claimed here.

Signed-off-by: Thaumy Cheng <thaumy.love@gmail.com>
---
 kernel/events/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index e870f12c3ad8..9c51c7a1ae80 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8499,11 +8499,16 @@ void perf_output_sample(struct perf_output_handle *handle,
 				perf_output_copy(handle, data->br_stack_cntr, size);
 			}
 		} else {
+			u64 nr = 0;
+			u64 hw_idx = -1ULL;
+
 			/*
 			 * we always store at least the value of nr
 			 */
-			u64 nr = 0;
 			perf_output_put(handle, nr);
+
+			if (branch_sample_hw_index(event))
+				perf_output_put(handle, hw_idx);
 		}
 	}

@@ -8837,6 +8842,8 @@ void perf_prepare_sample(struct perf_sample_data *data,
 	if (filtered_sample_type & PERF_SAMPLE_BRANCH_STACK) {
 		data->br_stack = NULL;
 		data->dyn_size += sizeof(u64);
+		if (branch_sample_hw_index(event))
+			data->dyn_size += sizeof(u64);
 		data->sample_flags |= PERF_SAMPLE_BRANCH_STACK;
 	}

--
2.56.0

