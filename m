Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541556;
	b=s2LOxbkwB25cr94Lp6eeRLJyfbJnyobYS2jtrMpEPocJXqEnD4HXEaqoYYTRI422wnhl
	 3PV+p7EwXq6n3JoTBsgrNqitZXTIh9A/IJiIW91oAekIqinND97UDZMamTfaHS7EC4bpx
	 buGkDuWmpZrYQNZwKrb0FvY5db8U2Rhx+qrOmvzei6LI2rSzkjaBsX5JbZSpCAlKDhIds
	 qpzB5J9PFlzYXDCMGntifLaq0VVUuN//BXhkJyQ7W/khAZkOwPm0JM1IoS51QOGSDVF2m
	 sbVzm6z1Kgu+RN+6pTbauWSfGHD5KmS54+0VcnBgJqOIYYym0LtlVqLITF5uQ2y7hWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VVJhQwsRjheYMq7E2yGzrEhTk5s/4Pi/tuTYWNiWjko=;
	b=uUVQcijG+DTNPcRi/yaW86KStDVvdU54llkKH5I2la3HKKA9IUMrSaDaN1MDH+yk3gEE
	 plmB1EjI9MQtyjzFogcWy82ZMPXPyeMFCe7NOZX4JrTmAzwix92SRvmZfZW0axD5RkoNn
	 f0DEZPg6nzHVvhHmcNrLT6QmDMFLQH9EIEWLMsSvR5dD5cneXWpKj457fmn0qC6Z8eWWX
	 7ER7n6R5tlkqF+3+fmiQLQ5bR7kEgSerx/eLa1ycI5IXQiCg5gaKltjmPE1sXWSCtS2fI
	 A3i1rfS0aw3lfZpG05G6ZLSVlBMuRXRhk4anG4fXdKimqQOHtytXowhTTMFN9IXXzZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Mi9voX5L;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF7606E18E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FF7606E18E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Mi9voX5L
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2766015f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541555; x=1796146355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVJhQwsRjheYMq7E2yGzrEhTk5s/4Pi/tuTYWNiWjko=;
        b=Mi9voX5Ld0bkkNa1euXdwVI+VoctikLY25KEw1i25FDmrduud7vf5PjpNPgXb3Md42
         n8vmGio5JTE5RQku+TsL8w+i2MvZ/tzQqPCnCMbfCzzKzRWhwDG9kf62HgWo7TUIzq56
         7cWhWyG4z6SAcZlNHZGElMRcGuvKSUpe0446MTIZMPlpBNQePF6ibB7n27PkdaGFuyeo
         UV+IzinuACH0cUpZ2GsLLqoFTt46Aoa3w32N/9ef+5vvJP2+ECnFOJANJMGPlA3/28Ns
         ea9KM6T4ge9ZDtxWp6sag/FZGq1/j/3tttNSmcZEJmxlH32cgPF8IL4rXa6gIIvXT5W6
         Sltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541555; x=1796146355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVJhQwsRjheYMq7E2yGzrEhTk5s/4Pi/tuTYWNiWjko=;
        b=z2OfzSfxCCxrNeivhqruSdgQ7/dV7DimaNTcXNrPKSVTW+QnJtJGHv7ZZ7k0ILOXGt
         v3oLBE/FaBToteMpxwngHk6pipCFyf2RqDGE1C44w2kg8dR/9EsQdakPpP7GBxMvv+gT
         r4M494wARnVp6qKnZotYxrQBIYVzE/FVnQ4kUq6WCWqJJh+cwP335cYvHlWW+aHCHDr4
         sAsa1nme4MitddbTZAh8asCVh+3MsrhKsr57NEjHqCe+2kx7D4/xngHOR0Qg5weuSsth
         fYNgGFwXBN8iXrar6WVkkQ7S9X7DalxUG1B8KqZWIl66RTu4zJCnoNiLZ9j2MwVlz73H
         3NGw==
X-Forwarded-Encrypted: i=1; AL+hErFFYUknJuBA2CWGRECZ/zFoMUyuDzA8zCvZitT1I69myBHqD8iUC2iHywwbWUj1DRjksecX8JVt9Cy0lq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BmqMt91UJc0qyV7n9VUvnHxydZf3N+yvf0LGDU8BU/BsfNz0l
	B8/98rtM6nk4kaA/mSn17x9MUAU1AwBub9i0oR7/2ecfWvNuHT5606AdxPOegkZvBZ2lDBDfc0t
	PJHD6YHk=
X-Gm-Gg: AZFdTZfY0MqsB8X+YcgdPnxO+skqXb02BkFlWWEEbaUfT8TR3Rbe3bfvEUq0Eubfd5V
	ziM9Bm4FFPGKB8Ou+SlDq9X6fyIl8WzXgKu8bXpEvN0khGfh9VhxONdRVR89mvnXmdQproK9W+6
	0nolfqaRkWiBCym+53r42bR64xzY9FqBNggpwF6zC0Y+bUz3gysp3GMXcVCGBjMmc3Vsbu3X35f
	GlN4ivcc7iOEHEHIauD4PzTvxAXyh8VnGvXn7HzYJ7o0MXSE+57pavr9kzn+tTYeL2a8ZuuUl1S
	dtcQIQOQy+mjBCvttdOWE9UqGN7Qizf54G8/lF+3NBOf7HGN+qdZ78vAfngVkKh4tDaM0tJVfJ0
	An0/gF0Nu3LDSmB+jyTfSLNIvweIStgeDXLwnC4oIyOfQl1nSr/MRKILdZ0fzAw7e1YY2sbhai9
	4JxiOsVBwrIl1031ONY8GjHX1icWE6jvifQLLPlkaIoxBH7QDd1afXHRqZfqydK6MNqNdCPtwMt
	bbuM95AY7Px6dXOdQ5nUj10hIl+9LrPpvMTp0prUhk/ubT8yXIA1EnVoss5sJR9RUIEs2X2vOso
	Z3rGwz/suDGwjCgtucHwcQmI0iXAzTKQVLkqcpEky5UzuDUH83q2Md3OZ5midv5L3wx32Ts=
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id ffacd0b85a97d-4abb6746af3mr30254134f8f.56.1795541554438;
        Tue, 24 Nov 2026 09:32:34 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:23 +0100
Subject: [PATCH v2 16/19] ASoC: qcom: lpass: enable the right codec_mem
 clock when usin LPM memory
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
Message-Id: <20261124-topic-sm8650-el2-v2-16-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6561;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uk3CHYwQ8gWmlrdbaFO/Xc25m80hPSF4BifAFdnrvKo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoiC3isDpEdg0St1GqjWZ8KPYconsJRQO+QJ82u
 79TfKGKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIgAKCRB33NvayMhJ0SLrD/
 4xrNN4YMSDpFk7MRptEw16707v5U+Hmv6ZQR4QmBbNQvMgDaq4lzyM5dT7fVkjkLlFaZMJkqtge5oR
 6Fia5plfZ3L4a0dgslb/ME/DmWe/ifTsy+DXL+ZZL7ggL1pFW5FSIEq576MG+mNPORHi9Z+WrhrHPI
 zgznrW7isqprBHPKCvBATj2TY1h0uasvukaE/h3q1uuvoNnr9dE41Zst0xsgijrIefBCQVwQ7z0+3b
 ZQEVGe82lzsQKjgPh1mPWt05gWADXkrUysnk59Yez2vbFdnBTS+Eh60vliEzz589m9Q9m1WPOEU4fW
 Mvj2TYBv0Tzipe06AevvR0D8NGzPuOfYPITjgS24PGa87kXMlXiiWPJeG+CkHlaao57CO2vz8HrVyN
 O58fSMTy+9dGVsJANvQ6esJL6qphsjahvmGvKzQ7ZrOgh9675xmfI5z60yLpNo4INVeQE3Ak2UuVuA
 QG2f9y40h/eTu+GvWUvwLHN6Pd+8a4NIjwzhUVh0mt68FaoYK6WpY9PeEeZbxdsE1DcGxR1q2Q7JjN
 HU+ddcTgVNzeYhmHNEYEGTUM0ZZlmmD6UBV3lqbgEE8070TOFyMNJg1VnjI6rR2YbMtVB/owfWO3nc
 AAQ9kGwBtMDRbmNkMUh7QiwYl06KLKgQkg88DAbzVO955Q+HkWvMbUApYPBQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The LPM memory zone needs different codec_mem clock to be
enabled depending on the DMA buffer offset, add an helper
returning the right clock and add support for the MI2S
ports using a non-core LPAIF.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 18 ++++++++++++------
 sound/soc/qcom/lpass-cpu.c     | 38 ++++++++++++++++++++++++++++++++++++--
 sound/soc/qcom/lpass.h         | 20 ++++++++++++++++++++
 3 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index d7f85a4f9d99..291c92936043 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -200,12 +200,14 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct clk *mem_clk;
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
-		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);
-		clk_prepare_enable(drvdata->codec_mem0);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->rxtx_lpm_offset);
+		clk_set_rate(mem_clk, CODEC_MEM_HZ_NORMAL);
+		clk_prepare_enable(mem_clk);
 		break;
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
 		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
@@ -213,8 +215,9 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 		break;
 	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
 	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
-		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);
-		clk_prepare_enable(drvdata->codec_mem1);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->wsa_lpm_offset);
+		clk_set_rate(mem_clk, CODEC_MEM_HZ_NORMAL);
+		clk_prepare_enable(mem_clk);
 		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
@@ -228,18 +231,21 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct clk *mem_clk;
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
-		clk_disable_unprepare(drvdata->codec_mem0);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->rxtx_lpm_offset);
+		clk_disable_unprepare(mem_clk);
 		break;
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
 		clk_disable_unprepare(drvdata->va_mem0);
 		break;
 	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
 	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
-		clk_disable_unprepare(drvdata->codec_mem1);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->wsa_lpm_offset);
+		clk_disable_unprepare(mem_clk);
 		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 8b005a87d408..a68ca4d4d63c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -82,25 +82,57 @@ static int lpass_cpu_daiops_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return ret;
 }
 
+/* LPM memory clock of the MI2S ports using a non-core LPAIF, NULL otherwise */
+static struct clk *lpass_cpu_mi2s_mem_clk(struct lpass_data *drvdata, unsigned int dai_id)
+{
+	unsigned int port_id = mi2s_port_id(dai_id);
+
+	if (!is_lpm_mi2s_port(drvdata, dai_id))
+		return NULL;
+
+	if (drvdata->mi2s_lpm[port_id] == LPASS_RXTX_CDC_LPM)
+		return lpass_cdc_dma_mem_clk(drvdata, drvdata->mi2s_lpm_offset[port_id]);
+
+	return drvdata->va_mem0;
+}
+
 static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	unsigned int port_id = mi2s_port_id(dai->driver->id);
+	struct clk *mem_clk = lpass_cpu_mi2s_mem_clk(drvdata, dai->driver->id);
 	int ret;
 
+	if (mem_clk) {
+		ret = clk_set_rate(mem_clk, LPASS_CODEC_MEM_HZ_NORMAL);
+		if (ret) {
+			dev_err(dai->dev, "error setting lpm mem clk rate: %d\n", ret);
+			return ret;
+		}
+		ret = clk_prepare_enable(mem_clk);
+		if (ret) {
+			dev_err(dai->dev, "error in enabling lpm mem clk: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[port_id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
-		return ret;
+		goto err_mem_clk;
 	}
 	ret = clk_prepare(drvdata->mi2s_bit_clk[port_id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
 		clk_disable_unprepare(drvdata->mi2s_osr_clk[port_id]);
-		return ret;
+		goto err_mem_clk;
 	}
 	return 0;
+
+err_mem_clk:
+	clk_disable_unprepare(mem_clk);
+	return ret;
 }
 
 static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
@@ -133,6 +165,8 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 	}
 
 	clk_unprepare(drvdata->mi2s_bit_clk[port_id]);
+
+	clk_disable_unprepare(lpass_cpu_mi2s_mem_clk(drvdata, dai->driver->id));
 }
 
 static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 3a37bf992645..9e18606ef3b8 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -30,6 +30,8 @@
 #define LPASS_CDC_DMA_INTF_FOUR_CHANNEL		(0x0F)
 #define LPASS_CDC_DMA_INTF_SIX_CHANNEL		(0x3F)
 #define LPASS_CDC_DMA_INTF_EIGHT_CHANNEL	(0xFF)
+#define LPASS_CDC_DMA_LPM_MEM_BLK_SIZE (2 * 8 * 1024)
+#define LPASS_CODEC_MEM_HZ_NORMAL		153600000
 
 #define LPASS_ACTIVE_PDS			(4)
 #define LPASS_PROXY_PDS			(8)
@@ -292,6 +294,24 @@ static inline bool is_lpm_mi2s_port(struct lpass_data *drvdata, unsigned int dai
 	return false;
 }
 
+static inline struct clk *lpass_cdc_dma_mem_clk(struct lpass_data *drvdata, u32 offset)
+{
+	unsigned int id = offset / LPASS_CDC_DMA_LPM_MEM_BLK_SIZE;
+
+	switch (id) {
+	case 0:
+		return drvdata->codec_mem0;
+	case 1:
+		return drvdata->codec_mem1;
+	case 2:
+		return drvdata->codec_mem2;
+	case 3:
+		return drvdata->codec_mem3;
+	default:
+		return NULL;
+	}
+}
+
 /* Vairant data per each SOC */
 struct lpass_variant {
 	u32	irq_reg_base;

-- 
2.34.1

